//
//  File.swift
//  
//
//  Created by Jan Anstipp on 21.10.20.
//

enum Arrays{
    
    struct Array:Codable, BundelPath {
        let array: [[Int]]
        
        enum CodingKeys: String, CodingKey {
               case array = "Array"
        }
        
        func path() -> (subDic:String,file:String,ext:String) {
            return ("JSONTestData/Array","Array","json")
        }
    }
    
    struct Boolean:Codable, BundelPath {
        let boolean: [Bool]
        
        enum CodingKeys: String, CodingKey {
            case boolean = "Boolean"
        }
        
        func path() -> (subDic:String,file:String,ext:String) {
            return ("JSONTestData/Array","Boolean","json")
        }
    }
    
    struct PurpleDouble:Codable, BundelPath {
        let double: [Double]

        enum CodingKeys: String, CodingKey {
            case double = "Double"
        }
        
        func path() -> (subDic:String,file:String,ext:String) {
            return ("JSONTestData/Array","Double","json")
        }
    }
    
    struct Empty:Codable, BundelPath {
        let empty: [Int]
        
        enum CodingKeys: String, CodingKey {
            case empty = "Empty"
        }
        
        func path() -> (subDic:String,file:String,ext:String) {
            return ("JSONTestData/Array","Empty","json")
        }
    }
    
    struct EnumInt: Codable, BundelPath{
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
    
    struct EnumString: Codable, BundelPath{
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
    
    struct PurpleFloat:Codable, BundelPath {
        let float: [Float]
        
        enum CodingKeys: String, CodingKey {
            case float = "Float"
        }
        
        func path() -> (subDic:String,file:String,ext:String) {
            return ("JSONTestData/Array","Float","json")
        }
    }

    struct Integer: Codable, BundelPath {
        let integer: [Int]
        
        enum CodingKeys: String, CodingKey {
            case integer = "Integer"
        }
        
        func path() -> (subDic:String,file:String,ext:String) {
            return ("JSONTestData/Array","Integer","json")
        }
    }
    
    struct Null: Codable, BundelPath {
        let null: [Int?]

        enum CodingKeys: String, CodingKey {
            case null = "Null"
        }
        
        func path() -> (subDic:String,file:String,ext:String) {
            return ("JSONTestData/Array","Null","json")
        }
    }
    
    struct Object: Codable, BundelPath {
        let object: [ObjectClass]

        enum CodingKeys: String, CodingKey {
            case object = "Object"
        }
        
        func path() -> (subDic:String,file:String,ext:String) {
            return ("JSONTestData/Array","Object","json")
        }
    }

    // MARK: - Array
    struct ObjectClass: Codable {
    }

    
    
    struct PurpleString: Codable, BundelPath {
        let string: [String]
        
        enum CodingKeys: String, CodingKey {
            case string = "String"
        }
        
        func path() -> (subDic:String,file:String,ext:String) {
            return ("JSONTestData/Array","String","json")
        }
    }

    struct Object2: Codable, BundelPath {
        let object2: [Object2Element]

        enum CodingKeys: String, CodingKey {
            case object2 = "Object2"
        }
        
        func path() -> (subDic:String,file:String,ext:String) {
            return ("JSONTestData/Array","Object2","json")
        }
        
    }

    // MARK: - Object2Element
    struct Object2Element: Codable {
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
