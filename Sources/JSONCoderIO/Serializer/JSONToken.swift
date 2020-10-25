//
//  JSONToken.swift
//  JSONDecoder
//
//  Created by Alex Soderman on 11/10/17.
//  Copyright © 2017 Alex Soderman. All rights reserved.
//
//https://github.com/johnezang/JSONKit
class JSONToken: CustomStringConvertible {
    
    let type: symbol
    var value: String?
    
    init(type: symbol) {
        self.type = type
    }
    
    init(type: symbol, value: String) {
        self.type = type
        self.value = value
    }
    
    var description: String {
        get {
            return "JSONToken: { type: \(self.type as Optional) : value: \(self.value as Optional) } "
        }
    }
}

enum symbol {
    case openParen
    case colon
    case closeParen
    case quote
    case alphanum
    case openBracket
    case closeBracket
    case comma
}
