//
//  TodoError.swift
//  Todo
//
//  Created by BinaryBoy on 8/1/19.
//  Copyright © 2019 dimohamdy. All rights reserved.
//

import Foundation

enum TodoError: Error {
    case failedConnection
    case idError
    case noResults
    case unknownError
    case runtimeError(String)
    var localizedDescription: String {
        switch self {
        case .noResults:
            return "No result found"
        case .unknownError:
            return "something wrong Happen, please try other time"
        default:
            return "something wrong Happen, please try other time"
        }
    }
}
