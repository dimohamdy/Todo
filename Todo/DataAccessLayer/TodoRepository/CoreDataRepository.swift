//
//  CoreDataRepository.swift
//  Todo
//
//  Created by BinaryBoy on 8/4/19.
//  Copyright © 2019 dimohamdy. All rights reserved.
//

import Foundation
import CoreData

final class TodoRepository: Repository {
    let managedContext = AppDelegate.shared.persistentContainer.viewContext

    func getAll() -> [TodoItem] {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: Constant.Entity.todo)

        do {
            return try managedContext.fetch(fetchRequest) as? [TodoItem] ?? []
        } catch {
            return []
        }
    }
    
    func get(identifier: String) -> TodoItem? {
        let managedContext = AppDelegate.shared.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: Constant.Entity.todo)
        
                fetchRequest.fetchLimit = 1
                fetchRequest.predicate = NSPredicate(format: "id = %@", identifier)
        do {
            let result = try managedContext.fetch(fetchRequest)
            if let items = result as? [TodoItem] {
               return items.first
            }
            return nil

        } catch {
        
            return nil
        }
    }
    
    @discardableResult func create(item: TodoItem) -> Bool {
        
        let todoEntity = NSEntityDescription.entity(forEntityName: Constant.Entity.todo, in: managedContext)!
        
        let todoItem = NSManagedObject(entity: todoEntity, insertInto: managedContext)
        todoItem.setValue(item.id, forKeyPath: "id")
        todoItem.setValue(item.name, forKey: "name")
        todoItem.setValue(item.details, forKey: "details")
        todoItem.setValue(item.completed, forKey: "completed")
        
        do {
            try managedContext.save()
            return true
        } catch {
            return false
        }
    }
    
    @discardableResult func update(item: TodoItem, completed: Bool = false) -> Bool {
      
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: Constant.Entity.todo)

        fetchRequest.predicate = NSPredicate(format: "id = %@", item.id)
        do {
            let result = try managedContext.fetch(fetchRequest)
            
            let todoItem = result[0] as! NSManagedObject
            todoItem.setValue(item.id, forKeyPath: "id")
            todoItem.setValue(item.name, forKey: "name")
            todoItem.setValue(item.details, forKey: "details")
            todoItem.setValue(String(completed), forKey: "completed")

            try managedContext.save()
            return true
        } catch {
            return false
        }
    }
    
    @discardableResult func delete(item: TodoItem) -> Bool {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: Constant.Entity.todo)

        fetchRequest.predicate = NSPredicate(format: "id = %@", item.id)
        do {
            let result = try managedContext.fetch(fetchRequest)
            
            let objectToDelete = result[0] as! NSManagedObject
            managedContext.delete(objectToDelete)
            
            do {
                try managedContext.save()
                return true
            } catch {
                print(error)
                return false
            }
        } catch {
            return false
        }
    }
}
