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
    var todoItem: TodoItem?
    var todoRepository: TodoRepository

    // output
    weak var delegate: TodoDetailsDelegate? {
        didSet {
            guard let delegate = delegate, let todoItem = todoItem else {
                return
            }
            delegate.updateData(todoItem: todoItem)
        }
    }
    
    init(todoItem: TodoItem? = nil, todoRepository: TodoRepository = TodoRepository()) {
        self.todoItem = todoItem
        self.todoRepository = todoRepository
    }
    
}

extension TodoDetailsViewModel {
    
    func save(item: TodoItem) -> Bool {
        print(item)
        print(todoRepository)
        print(todoItem)

        return todoRepository.update(item: item, completed: Bool(item.completed) ?? false)
    }
}
