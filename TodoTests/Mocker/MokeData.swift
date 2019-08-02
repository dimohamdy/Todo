//
//  MokeData.swift
//  TodoTests
//
//  Created by BinaryBoy on 8/2/19.
//  Copyright © 2019 dimohamdy. All rights reserved.
//

import Foundation
import RealmSwift
@testable import Todo

class MokeData {
    
    static func clearDatabase() {
        RealmManager.deleteAll()
    }
    
    static func setFakeData() {
        clearDatabase()
        for _ in 0 ... 10 {
            let todoItem =  createObject(with: Date.identifier)
            RealmManager.insert(todoItem: todoItem)
        }
    }
}

extension MokeData {
    static func createObject(with id: String) -> TodoItem {
        let todoItem = TodoItem()
        todoItem.id = id
        todoItem.name = "Complete the task"
        todoItem.details = "Writing unit test for database"
        todoItem.completed = false
        return todoItem
    }
}
