//
//  Reusable.swift
//  Todo
//
//  Created by BinaryBoy on 7/28/19.
//  Copyright © 2019 BinaryBoy. All rights reserved.
//

import Foundation

protocol Reusable {
    static var identifier: String { get }
}

extension Reusable {
    static var identifier: String {
        return "\(self)"
    }
}
