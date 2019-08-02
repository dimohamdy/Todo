//
//  TodoTableViewCellTests.swift
//  TodoTests
//
//  Created by BinaryBoy on 8/2/19.
//  Copyright © 2019 BinaryBoy. All rights reserved.
//

import XCTest
@testable import Todo

class TodoTableViewCellTests: XCTestCase {

    var cell: TodoTableViewCell!
    var todoListViewController: TodoListViewController!

    override func setUp() {
        super.setUp()
        todoListViewController =  TodoListViewController.setUpViewControllers()
        // Arrange: setup UINavigationController
        let navigationController = MockNavigationController(rootViewController: todoListViewController)
        UIApplication.shared.keyWindow?.rootViewController = navigationController
    }

    func testUIForCell() {
        if let cell = todoListViewController.todoTableView.cellForRow(at: IndexPath(row: 1, section: 0)) as? TodoTableViewCell {
            XCTAssertNotNil(cell.todoTitleLabel, "Add isDoneSwitch to cell")
            XCTAssertNotNil(cell.isDoneSwitch, "Add isDoneSwitch to cell")
        }
    }
}
