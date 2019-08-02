//
//  TodoRepository.swift
//  Todo
//
//  Created by BinaryBoy on 7/28/19.
//  Copyright © 2019 BinaryBoy. All rights reserved.
//

import Foundation

final class TodoRepository: Repository {

    func getAll() -> [TodoItem] {
        return RealmManager.getAll()
    }
    
    func get(identifier: String) -> TodoItem? {
        return RealmManager.get(identifier: identifier)
    }
    
    @discardableResult func create(item: TodoItem) -> Bool {
        return RealmManager.insert(todoItem: item)
    }
    
    @discardableResult func update(item: TodoItem, completed: Bool = false) -> Bool {
        return RealmManager.update(todoItem: item, completed: completed)
    }
    
    @discardableResult func delete(item: TodoItem) -> Bool {
        return RealmManager.delete(todoItem: item)
    }
}
                        
