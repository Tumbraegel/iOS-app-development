//
//  main.swift
//  iOS3-Busch-Tumbraegel
//
//  Created by Daniela Tumbraegel on 12.11.18.
//  Copyright © 2018 Daniela Tumbraegel. All rights reserved.
//

import Foundation

var book = AddressBook()
var isRunning = true

func addGenericAddresses() {
    book.add(card: AddressCard(firstname: "Bli", surname: "Busch", street: "Forsthofweg 7", zipcode: 86441, city: "Streitheim", hobbies: ["building forts", "making witches brews"], friends: [AddressCard]()))
    book.add(card: AddressCard(firstname: "Bla", surname: "Busch", street: "Forsthofweg 7", zipcode: 86441, city: "Streitheim", hobbies: ["Widdling"], friends: [AddressCard]()))
    let onlyFriend = AddressCard(firstname: "Me", surname: "Too", street: "Hupflstrasse", zipcode: 33678, city: "Tootingen", hobbies: ["Procrastination"], friends: [AddressCard]())
    book.add(card: onlyFriend)
    book.add(card: AddressCard(firstname: "Dan", surname: "Tumsi", street: "Weitweg 88", zipcode: 023576, city: "Vindiling", hobbies: ["Cooking"], friends:[onlyFriend]))
}

func start() {
    let path = "book.plist"
    book = loadBook(from: path)
    while isRunning {
        evaluate(input: read(with: "(A)dd, (S)earch, (L)ist or (Q)uit?"))
    }
    book.archive(path: path)
}

func loadBook(from path: String) -> AddressBook {
    if let loadedBook = AddressBook.addressBook(fromFile: path) {
        return loadedBook
    }else{
        return AddressBook()
    }
}

func read(with prompt: String) -> String {
    print(prompt)
    if let input = getInput(){
        return input
    }else{
        return read(with: "Please try again.")
    }
}

func getInput() -> String? {
    if let input = readLine(){
        return input.lowercased()
    }
    return nil
}


func evaluate(input: String){
    if input == "q"{
        isRunning = false
    }
    if input == "l"{
        print(book.list())
    }
    if input == "s"{
        searchContact()
    }
    if input == "a"{
        book.add(card: createNewContact())
    }
}


func getAddressCard() -> AddressCard? {
    var inInsertMode = true
    while inInsertMode {
        let searchName = read(with: "Enter surname or q to quit: ")
        if(searchName == "q"){
            inInsertMode = false
            return nil
        }else{
            if let result = book.search(surname: searchName){
                return result
            }else{
                return nil
            }
        }
    }
}

func createNewContact() -> AddressCard{
    let firstname = read(with: "Enter firstname:")
    let surname = read(with: "Enter surname:")
    let street = read(with: "Enter streetname and number:")
    let zipcode = intify()
    let city = read(with: "Enter city name:")
    let hobbies = getHobbies()
    return AddressCard(firstname: firstname, surname: surname, street: street, zipcode: zipcode, city: city, hobbies: hobbies, friends: [AddressCard]())
}

func intify() -> Int {
    if let zipcode = Int(read(with: "Enter zipcode:")){
        return zipcode
    }else{
        return intify()
    }
}

func getHobbies() -> [String]{
    var hobbies = [String]()
    var inInsertMode = true
    while inInsertMode {
        let input = read(with: "Insert a hobby or q to quit:")
        if input == "q"{
            inInsertMode = false
        }else{
            hobbies.append(input)
        }
    }
    return hobbies
}

func searchContact() {
    if let person = getAddressCard(){
        print(person.toString())
        let inputOption = read(with: "(B)efriend or (R)emove")
        if inputOption == "b"{
            if let friend = getAddressCard(){
                person.add(friend: friend)
            }
        }
        if inputOption == "r"{
            book.remove(card: person)
        }
    }
}

//addGenericAddresses()
start()
