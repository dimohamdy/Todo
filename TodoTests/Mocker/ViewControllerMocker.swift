//
//  ViewControllerMocker.swift
//  TodoTests
//
//  Created by BinaryBoy on 8/2/19.
//  Copyright © 2019 BinaryBoy. All rights reserved.
//

import Foundation
@testable import Todo

extension TodoListViewController {

    static func setUpViewControllers() -> TodoListViewController {

        MokeData.setFakeData()
        // Arrange: setup ViewController with data source
        let todoListViewController = TodoListBuilder.viewController(dataSource: TodoRepository()) as? TodoListViewController

        todoListViewController?.loadView()
        todoListViewController?.viewDidLoad()

        return todoListViewController!
    }

}
