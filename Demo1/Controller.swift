//
//  Home.swift
//  Demo1
//
//  Created by userext on 09/05/23.
//

import Foundation

final class Controller {
    
    private var name: String?
    private let menuOptionList = [Constants.Options.One, Constants.Options.Two, Constants.Options.Three, Constants.Options.Four, Constants.Options.Five, Constants.Options.Six]
    private var taskList: Array<Task> = []
    
    func mainGreeting() {
        print(Constants.Main.mark)
        print(Constants.Main.WhatYourName)
        print(Constants.Main.mark)
        name = readLine()
        print(Constants.Greeting.Hi + (name ?? "") + Constants.Greeting.Title)
        print(Constants.Main.InitialQuestion)
        taskList = decodeJSONFile(onDesktopWithFileName: (name ?? "") + ".json") ?? []
        showMenu()
    }
    
    private func showMenu() {
        print(Constants.Emojis.coelho)
        print(Constants.Main.mark)
        menuOptionList.forEach({ print($0) })
        print(Constants.Main.mark)
        guard let optionNotNil = readLine() else { return }
        handleOptions(option: optionNotNil)
    }
    
    private func handleOptions(option: String){
        let opt: Options = Options(rawValue: option) ?? .none
        switch opt {
        case .one:
            newTask()
            showMenu()
        case .two:
            editTask()
            showMenu()
        case .three:
            removeTask()
            showMenu()
        case .four:
            showMyTasks()
            showMenu()
        case .five:
            isCompleted()
            showMenu()
        case .six:
            print(Constants.Main.GoodBye + Constants.Emojis.imagem_correndo)
        case .none:
            print(Constants.Errors.InvalidOption)
            showMenu()
        }
    }
    
    private func isListEmpty() -> Bool{
        if taskList.isEmpty {
            print(Constants.Options.Tasks.EmptyList)
            showMenu()
            return taskList.isEmpty
        }
        return taskList.isEmpty
    }
}

// MARK: - TASK ACTIONS
extension Controller {
    
    private func newTask(){
        print(Constants.Emojis.imagem_correndo)
        print(Constants.Options.Tasks.AddTitleTask)
        guard let title = readLine(), !title.isEmpty else { return }
        print(Constants.Options.Tasks.AddTask)
        guard let newTask = readLine(), !newTask.isEmpty else { return }
        taskList.append(Task(index: taskList.count, description: newTask, title: "[ ] " + title))
        createData()
    }
    
    private func editTask(){
        if isListEmpty() { return }
        showMyTasks()
        print(Constants.Options.Tasks.EditTask)
        guard let index = Int(readLine() ?? "0"), index <= taskList.count else {
            print(Constants.Errors.InvalidOption)
            return
        }
        print(Constants.Options.Tasks.EditedTask)
        guard let modText = readLine() else {
            print(Constants.Errors.InvalidOption)
            return
        }
        taskList[index].description = modText
        createData()
    }
    
    private func removeTask(){
        if isListEmpty() { return }
        showMyTasks()
        print(Constants.Options.Tasks.RemoveTask)
        guard let title = readLine(), !title.isEmpty else {
            print(Constants.Errors.NotFound)
            return
        }
        taskList.forEach { task in
            if task.title.lowercased().contains(title.lowercased()) {
                taskList.remove(at: task.index)
            }
        }
        createData()
    }
    
    private func showMyTasks(){
        if isListEmpty() { return }
        print(Constants.Options.Tasks.ShowTaskMsg)
        taskList.forEach { task in
            print(" - " + task.title + "\n\t   " + task.description)
        }
        print("\n")
    }
    
    private func isCompleted(){
        if isListEmpty() { return }
        showMyTasks()
        print(Constants.Options.Tasks.whatComplet)
        guard let title = readLine(), !title.isEmpty else {
            print(Constants.Errors.NotFound)
            return
        }
        taskList.forEach { task in
            var titleTask = taskList[task.index].title
            if titleTask.lowercased().contains(title.lowercased()) {
                if titleTask.contains("[x]") {
                    titleTask = "[ ]\(String(titleTask.dropFirst(3)))"
                } else {
                    titleTask = "[x]\(String(titleTask.dropFirst(3)))"
                }
            }
            taskList[task.index].title = titleTask
        }
        createData()
    }
}

// MARK: - JSON ACTIONS
extension Controller {
    
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
}
