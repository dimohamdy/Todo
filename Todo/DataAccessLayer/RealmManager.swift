//
//  RealmManager.swift
//  Todo
//
//  Created by BinaryBoy on 7/30/19.
//  Copyright © 2019 dimohamdy. All rights reserved.
//

import Foundation
import RealmSwift

struct RealmManager {
    
    // MARK: DB Operations
    
    static func deleteAll() {
        do {
            let realm = try Realm()
            try realm.write {
                realm.delete(realm.objects(TodoItem.self))
            }
        } catch (let error) {
            print(error)
        }
    }
    
    static func get(identifier: String) -> TodoItem? {
        do {
            let realm = try Realm()
            return realm.object(ofType: TodoItem.self, forPrimaryKey: identifier)
        } catch (let error) {
            print(error)
            return nil
        }
        
    }
    
    @discardableResult static func delete(todoItem: TodoItem) -> Bool {
        do {
            let realm = try Realm()
            try realm.write {
                realm.delete(todoItem)
            }
            return true
        } catch {
            return false
            
        }
        
    }
    
    @discardableResult static func insert(todoItem: TodoItem) -> Bool {
        do {
            let realm = try Realm()
            realm.beginWrite()
            realm.add(todoItem)
            try realm.commitWrite()
            return true
        } catch {
            return false
        }
        
    }
    
    static func getAll() -> [TodoItem] {
        do {
            
            let realm = try Realm()
            let results = realm.objects(TodoItem.self)
            return Array(results)
        } catch {
            return []
        }
    }
    
    @discardableResult static func update(todoItem: TodoItem, completed: Bool) -> Bool {
        
        do {
            let realm = try Realm()
            realm.beginWrite()
            todoItem.completed = completed
            realm.add(todoItem, update: Realm.UpdatePolicy.modified)
            try realm.commitWrite()
            return true
        } catch {
            return false
        }
        
    }
}
