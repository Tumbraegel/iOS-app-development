//
//  AddressCard.swift
//  iOS3-Busch-Tumbraegel
//
//  Created by Daniela Tumbraegel on 12.11.18.
//  Copyright © 2018 Daniela Tumbraegel. All rights reserved.
//

import Foundation

class AddressCard: Codable, Equatable {
    
    var firstname : String
    var surname : String
    var street : String
    var zipcode : Int
    var city : String
    var hobbies : [String]
    var friends : [AddressCard]
    
    init(firstname: String, surname: String, street: String, zipcode: Int, city: String, hobbies: [String], friends: [AddressCard]) {
        self.firstname = firstname.lowercased()
        self.surname = surname.lowercased()
        self.street = street.lowercased()
        self.zipcode = zipcode
        self.city = city.lowercased()
        self.hobbies = hobbies
        self.friends = friends
    }
    
    static func == (person1: AddressCard, person2: AddressCard) -> Bool {
        return person1.surname == person2.surname && person1.firstname == person2.firstname
    }
    
    func add(hobby: String){
        hobbies.append(hobby)
    }
    
    func remove(hobby: String) {
        let hobbyIndex = hobbies.index(of: hobby)
        if let _hobbyIndex = hobbyIndex{
            hobbies.remove(at: _hobbyIndex)
        }
    }
    
    func add(friend: AddressCard) {
        friends.append(friend)
    }
    
    func remove(friend: AddressCard){
        let index = friends.index(of: friend)
        if let _index = index{
            friends.remove(at: _index)
        }
    }
    
    func toString() -> String {
        var output = ""
        output += "| \(self.firstname.capitalized) \(self.surname.capitalized) \n| \(self.street.capitalized) \n| \(self.zipcode) \(self.city.capitalized) \n"
        output += stringifyHobbies()
        output += stringifyFriends()
        return output
    }
    
    func stringifyHobbies() -> String {
        var output = "| Hobbies: \n"
        for hobby in hobbies {
            output += "| - \(hobby) \n"
        }
        return output
    }
    
    func stringifyFriends() -> String {
        var output = "| Friends: \n"
        for friend in friends{
            output += "| - \(friend.firstname) \(friend.surname) \n"
        }
        return output
    }
}
