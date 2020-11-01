//
//  File.swift
//  
//
//  Created by Jan Anstipp on 25.10.20.
//


enum Dictionarys{
    
    struct Array_:Codable, BundelPath {
        let array: [[String:Int]]

        enum CodingKeys: String, CodingKey {
            case array = "Array"
        }

        static func path() -> (subDic:String,file:String,ext:String) {
            return ("JSONTestData/Dictionary","Array","json")
        }
    }
    
    struct Boolean_:Codable, BundelPath {
        let boolean: [String:Bool]
        
        enum CodingKeys: String, CodingKey {
            case boolean = "Boolean"
        }
        
        static func path() -> (subDic:String,file:String,ext:String) {
            return ("JSONTestData/Dictionary","Boolean","json")
        }
    }
    
    struct Double_:Codable, BundelPath {
        let double: [String:Double]
        
        enum CodingKeys: String, CodingKey {
            case double = "Double"
        }
        
        static func path() -> (subDic:String,file:String,ext:String) {
            return ("JSONTestData/Dictionary","Double","json")
        }
    }
    
    struct Empty_:Codable, BundelPath {
        let empty: [String:Int]
        
        enum CodingKeys: String, CodingKey {
            case empty = "Empty"
        }
        
        static func path() -> (subDic:String,file:String,ext:String) {
            return ("JSONTestData/Dictionary","Empty","json")
        }
    }
    
    struct Enum_: Codable, BundelPath{
        var language: [String:Language]
        
        enum Language: Int, Codable {
            case german = 0
            case english = 1
            case spanish = 2
            case french = 3
        }
        
        enum CodingKeys: String, CodingKey {
            case language = "Enum"
        }
        
        static func path() -> (subDic:String,file:String,ext:String) {
            return ("JSONTestData/Dictionary","Enum","json")
        }
    }

    struct Float_:Codable, BundelPath {
        let float: [String:Float]
        
        enum CodingKeys: String, CodingKey {
            case float = "Float"
        }
        
        static func path() -> (subDic:String,file:String,ext:String) {
            return ("JSONTestData/Dictionary","Float","json")
        }
    }
    
    struct Integer_: Codable, BundelPath {
        let integer: [String:Int]
        
        enum CodingKeys: String, CodingKey {
            case integer = "Integer"
        }
        
        static func path() -> (subDic:String,file:String,ext:String) {
            return ("JSONTestData/Dictionary","Integer","json")
        }
    }
    
    struct IntegerArray_:Codable, BundelPath {
        let array: [String:[Int]]
        
        enum CodingKeys: String, CodingKey {
            case array = "IntegerArray"
        }
        
        static func path() -> (subDic:String,file:String,ext:String) {
            return ("JSONTestData/Dictionary","IntegerArray","json")
        }
    }
    
    struct Null_: Codable, BundelPath {
        let null: [String:Int?]
        
        enum CodingKeys: String, CodingKey {
            case null = "Null"
        }
        
        static func path() -> (subDic:String,file:String,ext:String) {
            return ("JSONTestData/Dictionary","Null","json")
        }
    }
    
    struct Object_: Codable, BundelPath {

        let object: [ObjectElement_]
        
        enum CodingKeys: String, CodingKey {
            case object = "Object"
        }
        
        static func path() -> (subDic:String,file:String,ext:String) {
            return ("JSONTestData/Dictionary","Object","json")
        }
    }
    
    // MARK: - Array
    struct ObjectElement_: Codable,Equatable {
    }
    
    
    
    struct String_: Codable, BundelPath {
        let string: [String:String]
        
        enum CodingKeys: String, CodingKey {
            case string = "String"
        }
        
        static func path() -> (subDic:String,file:String,ext:String) {
            return ("JSONTestData/Dictionary","String","json")
        }
    }
    
    struct Object2_: Codable, BundelPath {

        
        let object2: [Object2Element_]
        
        enum CodingKeys: String, CodingKey {
            case object2 = "Object2"
        }
        
        static func path() -> (subDic:String,file:String,ext:String) {
            return ("JSONTestData/Array","Object2","json")
        }
        
    }
    
    // MARK: - Object2Element
    struct Object2Element_: Codable,Equatable {
        let boolean: Bool
        let null: String?
        let string: String
        let number: Int
        
        enum CodingKeys: String, CodingKey {
            case boolean = "Boolean"
            case null = "Null"
            case string = "String"
            case number = "Number"
        }
    }
}

