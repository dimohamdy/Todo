//
//  MokeData.swift
//  TodoTests
//
//  Created by BinaryBoy on 8/2/19.
//  Copyright © 2019 dimohamdy. All rights reserved.
//

import Foundation
@testable import Todo

class MokeData {
    
    static func clearDatabase() {
        CoreDataManager.deleteAllData(entity: Constant.Entity.todo)
    }
    
    static func setFakeData() {
        clearDatabase()
        for _ in 0 ... 10 {
            let todoItem =  createObject(with: Date.identifier)
            CoreDataManager.insert(item: todoItem)
        }
    }
}

extension MokeData {
    static func createObject(with id: String) -> TodoItem {
        let todoItem = TodoItem(fromDictionary:
            ["id": id,
             "name": "Complete the task",
                "details": "Writing unit test for database",
                "completed": "false"
            ])
        return todoItem
    }
}
