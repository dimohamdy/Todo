//
//  ViewModelTests.swift
//  TodoTests
//
//  Created by BinaryBoy on 8/2/19.
//  Copyright © 2019 BinaryBoy. All rights reserved.
//

import XCTest
@testable import Todo

class ViewModelTests: XCTestCase {
    var viewModel: TodoListViewModel!

    override func setUp() {
        MokeData.setFakeData()
    }
    
    func testGetData() {
        let expectation = XCTestExpectation(description: #function)

        let todoRepository: TodoRepository = TodoRepository()
        
        // Arrange: setup ViewModel
        // Act: get data from API .
        viewModel = TodoListViewModel(todoRepository: todoRepository)
        DispatchQueue.main.async {
            // Assert: Verify it's have a data.
            XCTAssertGreaterThan(self.viewModel.itemsForTable.count, 0)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)

    }

    func testNotGetDataOnline() {
        let expectation = XCTestExpectation(description: #function)

        // Arrange: Mock Data from API

        let todoRepository: TodoRepository = TodoRepository()
        // Arrange: setup ViewModel
        // Act: get data from API .
        viewModel = TodoListViewModel(todoRepository: todoRepository)
        DispatchQueue.main.async {
            // Assert: Verify it's have a data.
            XCTAssertEqual(self.viewModel.itemsForTable.count, 1)
            if let firstItem = self.viewModel.itemsForTable.first {
                switch firstItem {
                case .error:
                    XCTAssert(true, "We found Error Item")
                default:
                    XCTFail("We dont't found Error Item")

                }
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 5)

    }

}
