//
//  File.swift
//  
//
//  Created by Jan Anstipp on 20.10.20.
//

import Foundation

protocol BundelPath: Equatable {
    func path() -> (subDic:String,file:String,ext:String)
}

enum Basic {
    
    struct Array_:Codable, BundelPath {
        let Array: [Int?]
        
        func path() -> (subDic:String,file:String,ext:String) {
            return ("JSONTestData/basic","Array","json")
        }
    }
    
    struct Boolean_:Codable,BundelPath {
        let Boolean: Bool
        
        func path() -> (subDic:String,file:String,ext:String) {
            return ("JSONTestData/basic","Boolean","json")
        }
    }
    
    struct Double_:Codable, BundelPath {
        let Double: Double
        
        func path() -> (subDic:String,file:String,ext:String) {
            return ("JSONTestData/basic","Double","json")
        }
    }
    
    struct Empty_:Codable, BundelPath {
        func path() -> (subDic:String,file:String,ext:String) {
            return ("JSONTestData/basic","Empty","json")
        }
    }
    
    struct EnumInt_: Codable, BundelPath{
        var language: Language
        
        enum Language: Int, Codable {
            case german = 0
            case english = 1
            case spanish = 2
            case french = 3
        }
        
        enum CodingKeys: String, CodingKey {
            case language = "Language"
        }
        
        func path() -> (subDic:String,file:String,ext:String) {
            return ("JSONTestData/basic","EnumInt","json")
        }
    }
    
    struct EnumString_: Codable, BundelPath{
        var language: Language
        
        enum Language: String, Codable {
            case german = "German"
            case english = "English"
            case spanish = "Spanish"
            case french = "French"
        }
        
        enum CodingKeys: String, CodingKey {
            case language = "Language"
        }
        
        func path() -> (subDic:String,file:String,ext:String) {
            return ("JSONTestData/basic","EnumString","json")
        }
    }
    
    struct Float_:Codable, BundelPath {
        let Float: Float
        
        func path() -> (subDic:String,file:String,ext:String) {
            return ("JSONTestData/basic","Float","json")
        }
    }
    struct Integer_:Codable, BundelPath {
        let Integer: Int
        
        func path() -> (subDic:String,file:String,ext:String) {
            return ("JSONTestData/basic","Integer","json")
        }
    }
    struct Null_:Codable, BundelPath {
        let Null: Int?
        
        func path() -> (subDic:String,file:String,ext:String) {
            return ("JSONTestData/basic","Null","json")
        }
    }
    
    
    
    struct Object_:Codable, BundelPath {
        let Object: Empty_
        
        func path() -> (subDic:String,file:String,ext:String) {
            return ("JSONTestData/basic","Object","json")
        }
    }
    
    struct String_: Codable, BundelPath{
        let string: String
        
        enum CodingKeys: String, CodingKey {
            case string = "String"
        }
        
        func path() -> (subDic:String,file:String,ext:String) {
            return ("JSONTestData/basic","String_","json")
        }
    }

}

