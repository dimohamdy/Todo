//
//  Date+Identifier.swift
//  Todo
//
//  Created by BinaryBoy on 8/2/19.
//  Copyright © 2019 dimohamdy. All rights reserved.
//

import Foundation

extension Date {
    static var identifier: String {
        return String(Date().timeIntervalSince1970)
    }
}
