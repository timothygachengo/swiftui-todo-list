//
//  Item.swift
//  todolist
//
//  Created by Timothy Mugo on 12/04/2024.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
