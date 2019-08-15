//
//  ViewController.swift
//  Curious Katie
//
//  Created by Peter Bradtke on 18/06/2019.
//  Copyright © 2019 Peter Bradtke. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // calls people from participants model
    var setOfPeople: [Person] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
       

    }
    //gets random number for person, age and interests
    private func getRandomNumber(from:Int, to:Int) -> Int {
        return Int.random(in: from ... to)
    }
    // Generates people, age
    private func generatePeople() {
        print("::: Present People! :::\n")
        setOfPeople = []
        var namesRemove = Person.names
        for _ in 0 ..< getRandomNumber(from: 2, to: 12) {
            let randomidx = getRandomNumber(from: 0, to: namesRemove.count - 1)
            setOfPeople.append(Person(name: namesRemove[randomidx],
                                      interest: generateInterest(of: getRandomNumber(from: 0, to: 10)),
                                      age: getRandomNumber(from: 12, to: 25)))
            namesRemove.remove(at: randomidx)
        }
        //Prints the people with thier age and a list of interests
        setOfPeople.forEach { (person) in
            print("\n\(person.name) (age: \(person.age) (interests:")
            person.interest.forEach({ (interest) in
                print(" \(interest.type.rawValue): \(interest.information)")
            })
        }
    }
    // Generates interests for participants
    func generateInterest(of number: Int) -> [Interest] {
        var interestsCopy = Interest.allInterests
        var interests: [Interest] = []
        for _ in 0 ..< number {
            let randomidx = getRandomNumber(from: 0, to: interestsCopy.count - 1)
            interests.append(Interest(type: interestsCopy[randomidx]))
            interestsCopy.remove(at: randomidx)
            
        }
        
        return interests
        
    }
    // prints a list of people that participants can be listed with
    func matchPeople() {
        print("\n\n::: Match People! :::\n")
        setOfPeople.forEach { (person) in
            
            print("\(person.name) can be paired with:")
            _ = setOfPeople.filter ({ (nextPerson) -> Bool in
                var didDifferenceAppear = false
                
                nextPerson.interest.forEach({ (nextPersonInterest) in
                    if !person.interest.contains (nextPersonInterest) {
                        didDifferenceAppear = true
                    }
                })
                if nextPerson.name != person.name {
                    print("\(nextPerson.name)")
                }
                return didDifferenceAppear
            })
            
            print("\n")
        }
    }
    // calls the generates and match people
    @IBAction func matchPeople(_ sender: Any) {
        generatePeople()
        matchPeople()
    }
            
}
