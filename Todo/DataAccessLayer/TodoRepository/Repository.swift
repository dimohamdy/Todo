//
//  Repository.swift
//  Todo
//
//  Created by BinaryBoy on 7/29/19.
//  Copyright © 2019 dimohamdy. All rights reserved.
//
import Foundation

protocol Repository {
    
    associatedtype T
    
    func getAll() -> [T]
    func get(identifier: String) -> T?
    func create(item: T) -> Bool
    func update(item: T, completed: Bool) -> Bool
    func delete(item: T) -> Bool
    
}
