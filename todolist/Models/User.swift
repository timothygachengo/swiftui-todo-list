//
//  User.swift
//  todolist
//
//  Created by Timothy Mugo on 12/04/2024.
//

import Foundation


struct User: Codable {
    let id: String;
    let name: String;
    let email: String;
    let joined: TimeInterval
}
