//
//  CoreDataManager.swift
//  Todo
//
//  Created by BinaryBoy on 8/4/19.
//  Copyright © 2019 dimohamdy. All rights reserved.
//

import CoreData

struct CoreDataManager {
    
    static func deleteAllData(entity: String) {
        let managedContext = AppDelegate.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        fetchRequest.returnsObjectsAsFaults = false
        
        do {
            let results = try managedContext.fetch(fetchRequest)
            for managedObject in results {
                let managedObjectData: NSManagedObject = managedObject as! NSManagedObject
                managedContext.delete(managedObjectData)
            }
        } catch let error {
            print("Detele all data in \(entity) error : \(error)")
        }
    }
    
    @discardableResult static func insert(item: TodoItem) -> Bool {
        
        let managedContext = AppDelegate.shared.persistentContainer.viewContext
        let todoEntity = NSEntityDescription.entity(forEntityName: "TodoItem", in: managedContext)!
        
        let todoItem = NSManagedObject(entity: todoEntity, insertInto: managedContext)
        todoItem.setValue(item.id, forKeyPath: "id")
        todoItem.setValue(item.name, forKey: "name")
        todoItem.setValue(item.details, forKey: "details")
        todoItem.setValue(item.completed, forKey: "completed")
        
        do {
            try managedContext.save()
            return true
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
            return false
        }
        
    }
    
}
