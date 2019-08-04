//
//  TodoDetailsViewController.swift
//  Todo
//
//  Created by BinaryBoy on 7/28/19.
//  Copyright (c) 2019 BinaryBoy. All rights reserved.
//

import UIKit

class TodoDetailsViewController: UIViewController {
    
    fileprivate var viewModel: TodoDetailsViewModel!

    var todoTitleTextField: UITextField!
    var todoDetailsTextView: UITextView!

    init(withViewModel viewModel: TodoDetailsViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupLayout()
    }

}

extension  TodoDetailsViewController: TodoDetailsDelegate {

    func updateData(todoItem: TodoItem) {
        title = todoItem.name
    }
    
}

// MARK: Setup
private extension TodoDetailsViewController {
    
    func setupViews() {
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveTodoItem))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelTodoItem))

        todoTitleTextField = UITextField()
        todoTitleTextField.placeholder = "Title"

        todoDetailsTextView = UITextView()
        todoDetailsTextView.text = "Enter Details Here"
        
        view.addSubview(todoTitleTextField)
        view.addSubview(todoDetailsTextView)
        
        view.backgroundColor = .white
    }
    
    func setupLayout() {
        todoTitleTextField.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(66)
            make.topMargin.equalTo(view).inset(10)
            make.left.equalTo(view).inset(10)
            make.right.equalTo(view).inset(10)
        }

        todoDetailsTextView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(todoTitleTextField.snp.bottom)
            make.left.equalTo(view).inset(10)
            make.right.equalTo(view).inset(10)
            make.bottom.equalTo(view).inset(10)
        }
    }
    
    @objc func saveTodoItem(sender: UIButton) {
        guard let name = todoTitleTextField.text, let details = todoDetailsTextView.text  else {
            //show alert message to fill data
            return
        }
        
        let todoItem = TodoItem(fromDictionary:
            ["id": Date.identifier,
             "name": name,
             "details": details,
             "completed": "false"
            ])
        
        if viewModel.save(item: todoItem) {
            navigationController?.popViewController(animated: true)
        }
    }
    
    @objc func cancelTodoItem(sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}
