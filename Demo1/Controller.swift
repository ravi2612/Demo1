//
//  Home.swift
//  Demo1
//
//  Created by userext on 09/05/23.
//

import Foundation

final class Controller {
    
    private var name: String?
    private let optList = [Constants.Options.One, Constants.Options.Two, Constants.Options.Three, Constants.Options.Four]
    private var taskList: Array<Task> = []
    
    func mainGreeting() {
        print(Constants.Main.WhatYourName)
        name = readLine()
        print(Constants.Greeting.Hi + (name ?? "") + Constants.Greeting.Title)
        print(Constants.Main.InitialQuestion)
        taskList = decodeJSONFile(onDesktopWithFileName: (name ?? "") + ".json") ?? []
        showMenu()
    }
    
    private func showMenu() {
        optList.forEach({ print($0) })
        guard let optionNotNil = readLine() else { return }
        handleOptions(option: optionNotNil)
    }
    
    private func handleOptions(option: String){
        let opt: Options = Options(rawValue: option) ?? .none
        switch opt {
        case .one:
            newTask()
            continueAnswer()
        case .two:
            editTask()
            continueAnswer()
        case .three:
            removeTask()
            continueAnswer()
        case .four:
            showMyTasks()
            continueAnswer()
        case .none:
            print(Constants.Main.InvalidOption)
            showMenu()
        }
    }
    
    private func newTask(){
        print(Constants.Options.Tasks.AddTask)
        guard let newTask = readLine() else { return }
        taskList.append(Task(index: taskList.count, description: newTask))
        createData()
    }
    
    private func createData() {
        do {
            let jsonData = try JSONEncoder().encode(taskList)
            
            guard let fileURL = FileManager.default.urls(for: .desktopDirectory, in: .userDomainMask).first?.appendingPathComponent("\(name ?? "").json") else { return }
            
            try jsonData.write(to: fileURL)
            
        } catch {
            print(error.localizedDescription)
        }
    }

    private func readJsonFile(fileName: String) -> Bool {
        let desktopPath = NSSearchPathForDirectoriesInDomains(.desktopDirectory, .userDomainMask, true)[0]
        let jsonFilePath = (desktopPath as NSString).appendingPathComponent(fileName)
        let fileManager = FileManager.default
        return fileManager.fileExists(atPath: jsonFilePath)
    }
    
    private func decodeJSONFile(onDesktopWithFileName fileName: String) -> [Task]? {
        let desktopPath = NSSearchPathForDirectoriesInDomains(.desktopDirectory, .userDomainMask, true)[0]
        let jsonFilePath = (desktopPath as NSString).appendingPathComponent(fileName)

        let fileManager = FileManager.default
        guard fileManager.fileExists(atPath: jsonFilePath) else {
            return nil
        }

        do {
            let jsonData = try Data(contentsOf: URL(fileURLWithPath: jsonFilePath))
            let tasks = try JSONDecoder().decode([Task].self, from: jsonData)
             taskList = tasks
            return tasks
        } catch {
            print("Erro ao decodificar o JSON: \(error)")
            return nil
        }
    }
    
    private func editTask(){
        testIfListIsEmpty()
        print(Constants.Options.Tasks.EditTask)
        guard let index = Int(readLine() ?? "0"), index <= taskList.count else { return }
        print(Constants.Options.Tasks.EditedTask)
        guard let modText = readLine() else { return }
        taskList[index].description = modText
    }
    
    private func removeTask(){
        testIfListIsEmpty()
        print(Constants.Options.Tasks.RemoveTask)
        guard let index = Int(readLine() ?? "0"), index <= taskList.count else { return }
        taskList.remove(at: index)
    }
    
    private func showMyTasks(){
        print(Constants.Options.Tasks.ShowTaskMsg)
        taskList.forEach { task in
            print(String(describing: task.index) + " - " + task.description)
        }
    }
    
    private func continueAnswer(){
        print(Constants.Main.ContinueQuestion)
        guard let answerNotNil = readLine() else { return }
        if answerNotNil.lowercased() == "y" {
            showMenu()
        } else if answerNotNil.lowercased() == "n" {
            print(Constants.Main.GoodBye)
        } else {
            print(Constants.Main.InvalidOption)
        }
    }
    
    private func testIfListIsEmpty(){
        if taskList.isEmpty {
            print(Constants.Options.Tasks.EmptyList)
            continueAnswer()
            return
        }
        showMyTasks()
    }
}
