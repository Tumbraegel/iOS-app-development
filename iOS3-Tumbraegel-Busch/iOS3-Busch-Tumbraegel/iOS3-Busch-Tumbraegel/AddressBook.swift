//
//  AddressBook.swift
//  iOS3-Busch-Tumbraegel
//
//  Created by Daniela Tumbraegel on 12.11.18.
//  Copyright © 2018 Daniela Tumbraegel. All rights reserved.
//

import Foundation

class AddressBook: Codable {
    var book : [AddressCard]
    
    init() {
        book = [AddressCard]()
    }
    
    class func addressBook(fromFile path: String) -> AddressBook?{
        let url = URL(fileURLWithPath: path)
        if let data = try? Data(contentsOf: url){
            let decoder = PropertyListDecoder()
            if let book =
                try? decoder.decode(AddressBook.self, from: data){
                return book
            }
        }
        return nil
    }
    
    func add(card: AddressCard) {
        book.append(card)
        sort()
    }
    
    func list() -> String {
        var list = ""
        for entry in book {
            list.append("+------------------------- \n")
            list.append(entry.toString())
            list.append("+------------------------- \n")
        }
        return list
    }
    
    func sort(){
        book.sort(by: {$0.surname < $1.surname})
    }
    
    func remove(card: AddressCard){
        removeReferences(friend: card)
            let index = book.index(of: card)
            if let _index = index{
                book.remove(at: _index)
            }
    }
    
    func getCard(by name: String) -> AddressCard? {
        for entry in book{
            if(entry.surname == name){
                return entry
            }
        }
        return nil
    }
    
    func removeReferences(friend: AddressCard) {
        for entry in book {
            let index = entry.friends.index(of: friend)
            if let _index = index{
                entry.friends.remove(at: _index)
            }
        }
    }
    
    func search(surname: String) -> AddressCard?{
        for entry in book {
            if(entry.surname.lowercased() == surname){
                return entry
            }
        }
        return nil
    }
    
    func archive(path: String) {
        let url = URL(fileURLWithPath: path)
        let encoder = PropertyListEncoder()
        if let data = try? encoder.encode(self){
            try? data.write(to: url)
        }
    }
}
