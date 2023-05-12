//
//  Constants.swift
//  Demo1
//
//  Created by userext on 09/05/23.
//

import Foundation

struct Constants {
    struct Main {
  
        static let mark = " //-----------------------------------------// "
        static let WhatYourName = "\t\t  Digite o nome do seu usuário "
        static let ContinueQuestion = "Você gostaria de voltar ao menu ? (y/n)"
        static let GoodBye = "Até a proxima\n"
        static let InitialQuestion = "O que gostaria de fazer ? "
    }
    struct Options {
        static let One = "\t1 - Adicionar uma nova tarefa"
        static let Two = "\t2 - Editar minhas tarefas         ^___^ "
        static let Three = "\t3 - Remover uma tarefa           ( o.o )"
        static let Four = "\t4 - Ver minha lista de tarefas    > ^ <  "
        static let Five = "\t5 - Marcar tarefa como concluida"
        static let Six = "\t6 - Fechar aplicativo"
        
        struct Tasks {
            static let AddTitleTask = "Qual o titulo da sua tarefa ?"
            static let AddTask = "Qual a descriçao da sua tarefa ?"
            static let RemoveTask = "Digite o titulo da atividade que gostaria de remover"
            static let EditTask = "Qual atividade gostaria de atualizar ?"
            static let EditedTask = "Digite a atualização"
            static let ShowTaskMsg = "Aqui estão suas Atividades: "
            static let EmptyList = "Sua Lista está vazia =("
            static let whatComplet = "Qual atividade está completa ?\nMe informa o titulo da atividade!"
        }
    }
    struct Greeting {
        static let Hi = "Oi "
        static let Title = " seja bem vindo à sua lista de tarefas !"
    }
    struct Errors {
        static let NotFound = "Tarefa não encontrada"
        static let InvalidOption = "Desculpa, mas não te entendi :("
    }
    struct Emojis {
        static let gato = """
                             ^___^  \n\
                            ( o.o ) \n\
                             > ^ <  \n
                        """
        static let imagem_correndo = """
                 O/                  \n\
                /T                \n\
                 /|                \n\
                                           
        """
        static let coelho = """
            
    (\\(\\    \n\
    ( -.-)   \n\
    o_(")(")  \n
"""
    }
}

