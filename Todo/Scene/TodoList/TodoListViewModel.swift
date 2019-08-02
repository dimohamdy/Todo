//
//  TodoListViewModel.swift
//  Todo
//
//  Created by BinaryBoy on 7/29/19.
//  Copyright © 2019 dimohamdy. All rights reserved.
//

import Foundation

enum ItemTableViewCellType {
    case cellItem(todoItem: TodoItem)
    case error(message: String)
    case empty
}
protocol ViewModelDelegate: class {
    func updateData(itemsForTable: [ItemTableViewCellType])
}
class TodoListViewModel {
    
    // input
    var todoRepository: TodoRepository!
    // output
    weak var delegate: ViewModelDelegate? {
        didSet {
            guard delegate != nil else {
                return
            }
            refreshData()
        }
    }

    // internal
    var itemsForTable: [ItemTableViewCellType] = [ItemTableViewCellType]()
    
    init(todoRepository: TodoRepository = TodoRepository()) {
        self.todoRepository = todoRepository
    }
    
    private func refreshData() {
        itemsForTable = []
        getData(todoRepository: self.todoRepository)
    }
    
    private func getData() {
        self.itemsForTable = []
        getData(todoRepository: self.todoRepository)
    }
    
}

// MARK: Setup

extension TodoListViewModel {
    
    private func getData(todoRepository: TodoRepository) {
        //delegate?.showLoading()
        let todoItems = todoRepository.getAll()
        if todoItems.isEmpty == true {
            handleNoTodoItems()
        } else {
            handleNewTodoItems(todoItems: todoItems)
        }

    }
    private func handleNewTodoItems(todoItems: [TodoItem]) {

        let newItems: [ItemTableViewCellType] = createItemsForTable(todoItems: todoItems)
        
        itemsForTable.append(contentsOf: newItems)
        delegate?.updateData(itemsForTable: itemsForTable)
    }
    
    private func handleNoTodoItems() {
        itemsForTable.append(.empty)
        delegate?.updateData(itemsForTable: itemsForTable)
    }

    private func createItemsForTable(todoItems: [TodoItem]) -> [ItemTableViewCellType] {
        var itemsForTable: [ItemTableViewCellType] = []
        
        for todoItem in todoItems {
            itemsForTable.append(.cellItem(todoItem: todoItem))
        }
        
        return itemsForTable
    }
    
    func delete(todoItem: TodoItem, index: Int) {
        
        if todoRepository.delete(item: todoItem) {
            itemsForTable.remove(at: index)
            refreshData()
        }
    }
}
