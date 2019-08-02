//
//  TodoListBuilder.swift
//  Todo
//
//  Created by BinaryBoy on 7/28/19.
//  Copyright (c) 2019 BinaryBoy. All rights reserved.
//

import UIKit

struct TodoListBuilder {

    static func viewController(dataSource: TodoRepository) -> UIViewController {
        
        let router = TodoListRouter()
        let viewModel = TodoListViewModel(todoRepository: dataSource)
        
        let viewController = TodoListViewController(withViewModel: viewModel, router: router)
        
        router.viewController = viewController
        
        return viewController
    }

    static func navigationController(dataSource: TodoRepository) -> UINavigationController {

        return UINavigationController(rootViewController: TodoListBuilder.viewController(dataSource: dataSource))
    }
}
