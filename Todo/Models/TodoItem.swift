//
//  TodoItem.swift
//  Todo
//
//  Created by BinaryBoy on 7/29/19.
//  Copyright © 2019 dimohamdy. All rights reserved.
//

import Foundation
import RealmSwift

class TodoItem: Object {
    // MARK: Properties
    @objc dynamic var id = Date.identifier
    @objc dynamic var name: String = ""
    @objc dynamic var details: String = ""
    @objc dynamic var completed: Bool = false
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
