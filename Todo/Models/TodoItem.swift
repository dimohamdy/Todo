//
//  TodoItem.swift
//  Todo
//
//  Created by BinaryBoy on 7/29/19.
//  Copyright © 2019 dimohamdy. All rights reserved.
//  Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import CoreData

class TodoItem: NSManagedObject, Reusable {
    
    @NSManaged var completed: String!
    @NSManaged var details: String!
    @NSManaged var id: String!
    @NSManaged var name: String!
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    convenience init(fromDictionary dictionary: [String: Any], context: NSManagedObjectContext = AppDelegate.shared.persistentContainer.viewContext) {
        let entity = NSEntityDescription.entity(forEntityName: Constant.Entity.todo, in: context)!
        self.init(entity: entity, insertInto: context)
        if let completedValue = dictionary["completed"] as? String {
            completed = completedValue
        }
        if let detailsValue = dictionary["details"] as? String {
            details = detailsValue
        }
        if let idValue = dictionary["id"] as? String {
            id = idValue
        }
        if let nameValue = dictionary["name"] as? String {
            name = nameValue
        }
    }
    
    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String: Any] {
        var dictionary = [String: Any]()
        if completed != nil {
            dictionary["completed"] = completed
        }
        if details != nil {
            dictionary["details"] = details
        }
        if id != nil {
            dictionary["id"] = id
        }
        if name != nil {
            dictionary["name"] = name
        }
        return dictionary
    }
    
}
