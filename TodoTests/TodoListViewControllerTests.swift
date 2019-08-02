//
//  TodoListViewControllerTests.swift
//  TodoTests
//
//  Created by BinaryBoy on 8/2/19.
//  Copyright © 2019 BinaryBoy. All rights reserved.
//

import XCTest
@testable import Todo

class TodoListViewControllerTests: XCTestCase {

    var todoListViewController: TodoListViewController!

    override func setUp() {
        super.setUp()
        todoListViewController =  TodoListViewController.setUpViewControllers()
        // Arrange: setup UINavigationController
        let navigationController = MockNavigationController(rootViewController: todoListViewController)
        UIApplication.shared.keyWindow?.rootViewController = navigationController
    }

    func testGetData() {

        let expectation = XCTestExpectation(description: #function)

        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            // Assert: Verify table have updated with data.
            let numberOfCellInFirstSection = self.todoListViewController!.todoTableView.numberOfRows(inSection: 0)
            XCTAssertEqual(numberOfCellInFirstSection, self.todoListViewController!.viewModel.itemsForTable.count)
            XCTAssertGreaterThan(numberOfCellInFirstSection, 0)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
    }

    func testUI() {
        XCTAssertNotNil(todoListViewController.todoTableView, "todoTableView added to view")
    }

}

class MockNavigationController: UINavigationController {

    var pushedViewController: UIViewController?

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        pushedViewController = viewController
        super.pushViewController(viewController, animated: true)
    }
}
