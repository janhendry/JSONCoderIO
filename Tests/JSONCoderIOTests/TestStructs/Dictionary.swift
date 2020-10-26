//
//  File.swift
//  
//
//  Created by Jan Anstipp on 25.10.20.
//


enum Dictionarys{
    
//    struct Array_:Codable, BundelPath {
//        let array: [[String:Int]]
//
//        enum CodingKeys: String, CodingKey {
//            case array = "Array"
//        }
//
//        func path() -> (subDic:String,file:String,ext:String) {
//            return ("JSONTestData/Array","Array","json")
//        }
//    }
    
    struct Boolean_:Codable, BundelPath {
        let boolean: [String:Bool]
        
        enum CodingKeys: String, CodingKey {
            case boolean = "Boolean"
        }
        
        func path() -> (subDic:String,file:String,ext:String) {
            return ("JSONTestData/Dictionary","Boolean","json")
        }
    }
    
    struct Double_:Codable, BundelPath {
        let double: [Double]
        
        enum CodingKeys: String, CodingKey {
            case double = "Double"
        }
        
        func path() -> (subDic:String,file:String,ext:String) {
            return ("JSONTestData/Array","Double","json")
        }
    }
    
    struct Empty_:Codable, BundelPath {
        let empty: [Int]
        
        enum CodingKeys: String, CodingKey {
            case empty = "Empty"
        }
        
        func path() -> (subDic:String,file:String,ext:String) {
            return ("JSONTestData/Array","Empty","json")
        }
    }
    
    struct EnumInt_: Codable, BundelPath{
        var language: [Language]
        
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
            return ("JSONTestData/Array","EnumInt","json")
        }
    }
    
    struct EnumString_: Codable, BundelPath{
        var language: [Language]
        
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
            return ("JSONTestData/Array","EnumString","json")
        }
    }
    
    struct Float_:Codable, BundelPath {
        let float: [Float]
        
        enum CodingKeys: String, CodingKey {
            case float = "Float"
        }
        
        func path() -> (subDic:String,file:String,ext:String) {
            return ("JSONTestData/Array","Float","json")
        }
    }
    
    struct Integer_: Codable, BundelPath {
        let integer: [Int]
        
        enum CodingKeys: String, CodingKey {
            case integer = "Integer"
        }
        
        func path() -> (subDic:String,file:String,ext:String) {
            return ("JSONTestData/Array","Integer","json")
        }
    }
    
    struct IntegerArray_:Codable, BundelPath {
        let array: [String:[Int]]
        
        enum CodingKeys: String, CodingKey {
            case array = "Array"
        }
        
        func path() -> (subDic:String,file:String,ext:String) {
            return ("JSONTestData/Array","Array","json")
        }
    }
    
    struct Null_: Codable, BundelPath {
        let null: [Int?]
        
        enum CodingKeys: String, CodingKey {
            case null = "Null"
        }
        
        func path() -> (subDic:String,file:String,ext:String) {
            return ("JSONTestData/Array","Null","json")
        }
    }
    
    struct Object_: Codable, BundelPath {
        let object: [ObjectElement_]
        
        enum CodingKeys: String, CodingKey {
            case object = "Object"
        }
        
        func path() -> (subDic:String,file:String,ext:String) {
            return ("JSONTestData/Array","Object","json")
        }
    }
    
    // MARK: - Array
    struct ObjectElement_: Codable {
    }
    
    
    
    struct String_: Codable, BundelPath {
        let string: [String]
        
        enum CodingKeys: String, CodingKey {
            case string = "String"
        }
        
        func path() -> (subDic:String,file:String,ext:String) {
            return ("JSONTestData/Array","String","json")
        }
    }
    
    struct Object2_: Codable, BundelPath {
        let object2: [Object2Element_]
        
        enum CodingKeys: String, CodingKey {
            case object2 = "Object2"
        }
        
        func path() -> (subDic:String,file:String,ext:String) {
            return ("JSONTestData/Array","Object2","json")
        }
        
    }
    
    // MARK: - Object2Element
    struct Object2Element_: Codable {
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

