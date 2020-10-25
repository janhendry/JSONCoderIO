//
//  File.swift
//  
//
//  Created by Jan Anstipp on 20.10.20.
//

import Foundation

protocol BundelPath {
    func path() -> (subDic:String,file:String,ext:String)
}

enum Basic {
    
    struct Array:Codable, BundelPath {
        let Array: [Int?]
        
        func path() -> (subDic:String,file:String,ext:String) {
            return ("JSONTestData/basic","Array","json")
        }
    }
    
    struct Boolean:Codable,BundelPath {
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
    
    struct Empty:Codable, BundelPath {
        func path() -> (subDic:String,file:String,ext:String) {
            return ("JSONTestData/basic","Empty","json")
        }
    }
    
    struct Float_:Codable, BundelPath {
        let Float: Float
        
        func path() -> (subDic:String,file:String,ext:String) {
            return ("JSONTestData/basic","Float","json")
        }
    }
    struct Integer:Codable, BundelPath {
        let Integer: Int
        
        func path() -> (subDic:String,file:String,ext:String) {
            return ("JSONTestData/basic","Integer","json")
        }
    }
    struct Null:Codable, BundelPath {
        let Null: Int?
        
        func path() -> (subDic:String,file:String,ext:String) {
            return ("JSONTestData/basic","Null","json")
        }
    }
    
    
    
    struct Object:Codable, BundelPath {
        let Object: Empty
        
        func path() -> (subDic:String,file:String,ext:String) {
            return ("JSONTestData/basic","Object","json")
        }
    }
    
    struct PurpleString: Codable, BundelPath{
        let string: String
        
        enum CodingKeys: String, CodingKey {
            case string = "String"
        }
        
        func path() -> (subDic:String,file:String,ext:String) {
            return ("JSONTestData/basic","String_","json")
        }
    }
    
    struct EnumString: Codable, BundelPath{
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
    
    struct EnumInt: Codable, BundelPath{
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
}

