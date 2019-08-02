//
//  LoginViewModel.swift
//  Todo
//
//  Created by BinaryBoy on 7/28/19.
//  Copyright (c) 2019 BinaryBoy. All rights reserved.
//

import Foundation

protocol TodoDetailsDelegate: class {
    func updateData(todoItem: TodoItem)
}

class TodoDetailsViewModel {
    
    // input
    var todoItem: TodoItem
    var todoRepository: TodoRepository

    // output
    weak var delegate: TodoDetailsDelegate? {
        didSet {
            guard let delegate = delegate else {
                return
            }
            delegate.updateData(todoItem: todoItem)
        }
    }
    
    init(todoItem: TodoItem = TodoItem(), todoRepository: TodoRepository = TodoRepository()) {
        self.todoItem = todoItem
        self.todoRepository = todoRepository
    }
    
}

extension TodoDetailsViewModel {
    
    func save(todoItem: TodoItem) -> Bool {
        return todoRepository.update(item: todoItem, completed: todoItem.completed)
    }
}
