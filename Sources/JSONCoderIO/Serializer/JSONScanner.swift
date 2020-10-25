//
//  JSONScanner.swift
//  JSONDecoder
//
//  Created by Alex Soderman on 11/10/17.
//  Copyright © 2017 Alex Soderman. All rights reserved.
//
//https://github.com/johnezang/JSONKit
class JSONScanner {
    
    static func scan(input: String) -> [JSONToken] {
        
        var tokens = [JSONToken]()
        var buffer: String = ""
        var scanningString = false
        var escape = -1
        
        func commitString() {
            if buffer != "" {
                tokens.append(JSONToken(type: .alphanum, value: buffer))
                buffer = ""
            }
        }
        
        for (index, c) in input.enumerated() {
            switch (c) {
            case "{":
                if(scanningString) { buffer.append(c);continue }
                tokens.append(JSONToken(type: .openParen))
            case ":":
                if(scanningString) { buffer.append(c);continue }
                tokens.append(JSONToken(type: .colon))
            case "}":
                if(scanningString) { buffer.append(c);continue }
                commitString()
                tokens.append(JSONToken(type: .closeParen))
            case "\\":
                if(scanningString) { escape = index; continue }
            case "\"":
                if (escape == index-1) {
                    buffer.append("\"")
                    continue
                }
                commitString()
                scanningString = !scanningString
                tokens.append(JSONToken(type: .quote))
            case "[":
                if(scanningString) { buffer.append(c);continue }
                tokens.append(JSONToken(type: .openBracket))
            case "]":
                if(scanningString) { buffer.append(c);continue }
                commitString()
                tokens.append(JSONToken(type: .closeBracket))
            case ",":
                if(scanningString) { buffer.append(c);continue }
                commitString()
                tokens.append(JSONToken(type: .comma))
            default:
                if scanningString {
                    buffer.append(c)
                } else if c == "\n" || c == "\t"{
                    continue
                } else if c == " " {
                    if buffer != "" {
                        commitString()
                    }
                    continue
                } else {
                    buffer.append(c)
                }
            }
        }
        return tokens
    }

}
