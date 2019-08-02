//
//  TodoListDataSource.swift
//  Todo
//
//  Created by BinaryBoy on 7/29/19.
//  Copyright © 2019 dimohamdy. All rights reserved.
//

import UIKit

class TodoListDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var itemsForTable: [ItemTableViewCellType]
    var viewModel: TodoListViewModel
    
    struct Constant {
        static let heightOfTodoCell: CGFloat = 120
    }
    
    init(viewModel: TodoListViewModel, itemsForTable: [ItemTableViewCellType]) {
        self.itemsForTable = itemsForTable
        self.viewModel = viewModel
    }
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsForTable.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = itemsForTable[indexPath.row]
        switch item {
        case .cellItem(let todoItem):
            if let cell: TodoTableViewCell = tableView.dequeueReusableCell(for: indexPath) {
                cell.todoItem = todoItem
                return cell
            }
            return UITableViewCell()
        case .error(let message):
            return UITableViewCell.emptyCell(message: message)
        case .empty:
            return UITableViewCell.emptyCell(message: "No Todo found")
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let item = itemsForTable[indexPath.row]
        switch item {
        case .cellItem:
            return Constant.heightOfTodoCell
        case .error, .empty:
            return tableView.frame.size.height
            
        }
        
    }

     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            let item = itemsForTable[indexPath.row]
            switch item {
            case .cellItem(let todoItem):
//                tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
                viewModel.delete(todoItem: todoItem, index: indexPath.row)
            default :
                return
                
            }

        }
    }
}
