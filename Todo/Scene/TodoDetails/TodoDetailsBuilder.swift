//
//  LoginBuilder.swift
//  Todo
//
//  Created by BinaryBoy on 7/28/19.
//  Copyright (c) 2019 BinaryBoy. All rights reserved.
//

import UIKit

struct TodoDetailsBuilder {
    
    static func viewController(todoItem: TodoItem? = nil) -> UIViewController {
        
        let viewModel = TodoDetailsViewModel(todoItem: todoItem)
        
        let viewController = TodoDetailsViewController(withViewModel: viewModel)
        
        viewModel.delegate = viewController
        
        return viewController
    }

}
