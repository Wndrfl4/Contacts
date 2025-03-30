//
//  Person.swift
//  Contacts
//
//  Created by Aslan  on 16.10.2024.
//

import Foundation
struct Person: Codable{
    var name: String
    var surename: String
    var number: String
    
    init(name: String, surename: String, number: String) {
            self.name = name
            self.surename = surename
            self.number = number
        }
}
