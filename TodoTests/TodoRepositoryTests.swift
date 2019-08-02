//
//  TodoRepositoryTests.swift
//  TodoTests
//
//  Created by BinaryBoy on 8/2/19.
//  Copyright © 2019 BinaryBoy. All rights reserved.
//

import XCTest
@testable import Todo

class TodoRepositoryTests: XCTestCase {
    
    var todoRepository: TodoRepository!
    let identifierForItem1: String = "\(Date.identifier)1"
    let identifierForItem2: String = "\(Date.identifier)2"
    let identifierForItem3: String = "\(Date.identifier)3"

    override func setUp() {

        //Clear databsae
        RealmManager.deleteAll()
        // Arrange: setup ViewModel
        todoRepository = TodoRepository()
        
        //insert data
        let todoItem1 = MokeData.createObject(with: identifierForItem1)
        todoRepository.create(item: todoItem1)
        
        let todoItem2 = MokeData.createObject(with: identifierForItem2)
        todoRepository.create(item: todoItem2)
        
        let todoItem3 = MokeData.createObject(with: identifierForItem3)
        todoRepository.create(item: todoItem3)
        
    }

    func testGetItemsFromDatabase() {
        // Act: get data from API .
       let todoItems =  todoRepository.getAll()
        // Assert: Verify it's have a data.
        XCTAssertGreaterThan(todoItems.count, 0)
    }

    func testGetItemFromDatabase() {
        // Act: get data from Database .
        let todoItem =  todoRepository.get(identifier: identifierForItem1)
        // Assert: Verify it's have a data.
        XCTAssertNotNil(todoItem, "Get object from Database with primarykey")
    }
    
    func testInsertItemToDatabase() {
        let identifierForItem = Date.identifier
        let todoItem = MokeData.createObject(with: identifierForItem)
        XCTAssert(todoRepository.create(item: todoItem), "The create of item in the database")
    }
    
    func testDeleteItemFromDatabase() {
        let identifierForItem = Date.identifier
        let todoItem  = MokeData.createObject(with: identifierForItem)
        XCTAssert(todoRepository.delete(item: todoItem), "The delete of item in the database")
    }
}
