//
//  interests.swift
//  Curious Katie
//
//  Created by Peter Bradtke on 28/06/2019.
//  Copyright © 2019 Peter Bradtke. All rights reserved.
//

import Foundation
class Interest: Equatable {
    
    static func == (lhs: Interest, rhs: Interest) -> Bool {
        return lhs.type == rhs.type
        
    }
    
    enum InterestType: String, CaseIterable {
            case Sports
            case News
            case Gardening
            case Cycling
            case Running
            case Reading
            case Gaming
            case Films_and_TV = "Films and TV"
            case Social
            case Work
            
    }
    
    private let description: [InterestType: String] = [.Sports: "from football to motorsport",
                                               .News: "watching news on tv or reading the news paper",
                                               .Gardening: "you got greenthumbs?",
                                               .Cycling: "from spinning classes to the road",
                                               .Running: " 100m to 10km",
                                               .Reading: "for the bookworms",
                                               .Gaming: "console war or PC master race",
                                               .Films_and_TV: "from Avengers to Dora",
                                               .Social: "from social media to drinks with friends",
                                               .Work: "for people that love work that much"]
    
    var type: InterestType
    let information: String
    
    init (type: InterestType) {
        self.type = type
        self.information = description [type]!
    }
    
    static let allInterests = InterestType.allCases
    func getRandomInterest(from:Int, to: Int) -> Int {
        return Int.random(in: from ..< to)
    }
}
    


