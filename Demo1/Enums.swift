//
//  Enums.swift
//  Demo1
//
//  Created by userext on 09/05/23.
//

import Foundation

enum Options: String {
    
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case none = "0"
    
    var number: Int {
        switch self {
        case .one:
            return 1
        case .two:
            return 2
        case .three:
            return 3
        case .four:
            return 4
        case .five:
            return 5
        case .none:
            return 0
        }
    }
}
