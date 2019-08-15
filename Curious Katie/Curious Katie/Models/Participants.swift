//
//  participants.swift
//  Curious Katie
//
//  Created by Peter Bradtke on 28/06/2019.
//  Copyright © 2019 Peter Bradtke. All rights reserved.
//

import Foundation

class Person {
  
    static var names = ["Peter", "Chris", "Sarah", "Ollie", "Luke", "Victoria", "James", "Louis", "Emma", "Jay", "Ted", "Andy"]
    
    var name: String
    var interest: [Interest]
    let age: Int
    
    init(name: String, interest: [Interest], age: Int) {
        self.age = age
        self.name = name
        self.interest = interest
    }
    
}

