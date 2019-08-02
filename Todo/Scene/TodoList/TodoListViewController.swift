//
//  TodoListViewController.swift
//  Todo
//
//  Created by BinaryBoy on 8/2/19.
//  Copyright © 2019 dimohamdy. All rights reserved.
//

import UIKit

class TodoListViewController: UIViewController {
    
    var viewModel: TodoListViewModel!
    var router: TodoListRouter!
    
    var tableViewDataSource: TodoListDataSource!
    var todoTableView: UITableView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(withViewModel viewModel: TodoListViewModel, router: TodoListRouter) {
        self.viewModel = viewModel
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupLayout()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.delegate = self
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        viewModel.delegate = nil
    }
    
}

extension  TodoListViewController: ViewModelDelegate {
    func updateData(itemsForTable: [ItemTableViewCellType]) {
        
        if tableViewDataSource == nil {
            tableViewDataSource = TodoListDataSource(viewModel: self.viewModel, itemsForTable: itemsForTable)
        } else {
            tableViewDataSource.itemsForTable = itemsForTable
        }
        
        DispatchQueue.main.async {
            self.todoTableView.dataSource = self.tableViewDataSource
            self.todoTableView.delegate = self.tableViewDataSource
            self.todoTableView.reloadData()
        }
    }
    
}
// MARK: Setup
private extension TodoListViewController {
    
    func setupViews() {
        title = "Todo List"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTodoItem))
        
        todoTableView = UITableView()
        
        todoTableView.backgroundColor = .white
        todoTableView.frame = self.view.frame
        todoTableView.register(TodoTableViewCell.self, forCellReuseIdentifier: TodoTableViewCell.identifier)
        
        view.addSubview(todoTableView)
    }
    
    func setupLayout() {
        
        todoTableView.snp.makeConstraints { (make) -> Void in
            make.edges.equalTo(self.view).inset(0)
        }
        
    }
    
    @objc func addTodoItem(sender: UIButton) {
        router.addTodoItem()
    }
    
}
