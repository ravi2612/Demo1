//
//  Constants.swift
//  Demo1
//
//  Created by userext on 09/05/23.
//

import Foundation

struct Constants {
    struct Main {
        static let WhatYourName = "Qual seu nome ?"
        static let ContinueQuestion = "Você gostaria de realizar mais alguma ação na sua lista ? (y/n)"
        static let GoodBye = "Até a proxima ;)"
        static let InvalidOption = "Desculpa, mas não te entendi :("
        static let InitialQuestion = "O que gostaria de fazer ?"
    }
    struct Options {
        static let One = "1 - Adicionar uma nova tarefa"
        static let Two = "2 - Editar minhas tarefas"
        static let Three = "3 - Remover uma tarefa"
        static let Four = "4 - Ver minha lista de tarefas"
        
        struct Tasks {
            static let AddTask = "O que gostaria de adicionar a sua lista ?"
            static let RemoveTask = "Digite o indice de qual atividade gostaria de remover"
            static let EditTask = "Qual atividade gostaria de atualizar ?"
            static let EditedTask = "Digite a atualização"
            static let ShowTaskMsg = "Aqui estão suas Atividades: "
            static let EmptyList = "Sua Lista está vazia =("
        }
    }
    struct Greeting {
        static let Hi = "Oi "
        static let Title = " seja bem vindo à sua lista de tarefas !"
    }
}

