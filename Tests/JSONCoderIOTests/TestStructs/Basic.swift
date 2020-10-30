//
//  File.swift
//  
//
//  Created by Jan Anstipp on 20.10.20.
//

import Foundation

protocol BundelPath: Equatable {
    static func path() -> (subDic:String,file:String,ext:String)
}

enum Basic {
    
    struct Array_:Codable, BundelPath {
        let Array: [Int?]
        
        static func path() -> (subDic:String,file:String,ext:String) {
            return ("JSONTestData/basic","Array","json")
        }
    }
    
    struct Boolean_:Codable,BundelPath {
        let Boolean: Bool
        
        static func path() -> (subDic:String,file:String,ext:String) {
            return ("JSONTestData/basic","Boolean","json")
        }
    }
    
    struct Double_:Codable, BundelPath {
        let Double: Double
        
        static func path() -> (subDic:String,file:String,ext:String) {
            return ("JSONTestData/basic","Double","json")
        }
    }
    
    struct Empty_:Codable, BundelPath {
        static func path() -> (subDic:String,file:String,ext:String) {
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
        
        static func path() -> (subDic:String,file:String,ext:String) {
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
        
        static func path() -> (subDic:String,file:String,ext:String) {
            return ("JSONTestData/basic","EnumString","json")
        }
    }
    
    struct Float_:Codable, BundelPath {
        let Float: Float
        
        static func path() -> (subDic:String,file:String,ext:String) {
            return ("JSONTestData/basic","Float","json")
        }
    }
    struct Integer_:Codable, BundelPath {
        let Integer: Int
        let int8 : Int8
        let int16 : Int16
        let int32 : Int32
        let int64 : Int64
        let intu : UInt
        let intu8 : UInt8
        let intu16 : UInt16
        let intu32 : UInt32
        let intu64 : UInt64
        
        static func path() -> (subDic:String,file:String,ext:String) {
            return ("JSONTestData/basic","Integer","json")
        }

        enum CodingKeys: String, CodingKey {
            case Integer
            case int16
            case int32
            case int64
            case int8
            case intu
            case intu16
            case intu32
            case intu64
            case intu8
        }
    }
    
    struct Null_:Codable, BundelPath {
         let Null: Int?
         
         static func path() -> (subDic:String,file:String,ext:String) {
             return ("JSONTestData/basic","Null","json")
         }
    }
    
    
    struct Object_:Codable, BundelPath {
        let Object: Empty_
        
        
        static func path() -> (subDic:String,file:String,ext:String) {
            return ("JSONTestData/basic","Object","json")
        }
        
        
    }
    
    struct String_: Codable, BundelPath{
        let string: String
            enum CodingKeys: String, CodingKey {
            case string = "String"
        }
        
        static func path() -> (subDic:String,file:String,ext:String) {
            return ("JSONTestData/basic","String_","json")
        }
    }
    

}

