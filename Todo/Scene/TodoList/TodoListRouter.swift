//
//  TodoListRouter.swift
//  Todo
//
//  Created by BinaryBoy on 7/28/19.
//  Copyright (c) 2019 BinaryBoy. All rights reserved.
//

import Foundation

class TodoListRouter {
    weak var viewController: TodoListViewController?

    func navigateToItemDetails(todoItem: TodoItem) {
        
           let todoDetailsViewController = TodoDetailsBuilder.viewController(todoItem: todoItem)
        viewController?.navigationController?.pushViewController(todoDetailsViewController, animated: true)
    }
    
    func addTodoItem() {
        let todoDetailsViewController = TodoDetailsBuilder.viewController()
        viewController?.navigationController?.pushViewController(todoDetailsViewController, animated: true)
    }
}
