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
    
    func mainGreeting() {
        print(Constants.Main.WhatYourName)
        name = readLine()
        print(Constants.Greeting.Hi + (name ?? "") + Constants.Greeting.Title)
        print("O que gostaria de fazer ?")
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
        case .two:
            editTask()
        case .three:
            removeTask()
        case .four:
            showMyTasks()
        case .none:
            print("Escolha uma opção valida")
            showMenu()
        }
    }
    
    private func newTask(){
        
    }
    private func editTask(){
        
    }
    private func removeTask(){
        
    }
    private func showMyTasks(){
        
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
}
