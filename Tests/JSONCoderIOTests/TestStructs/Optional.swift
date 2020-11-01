//
//  File.swift
//  
//
//  Created by Jan Anstipp on 26.10.20.
//


enum Optionals{
    
    struct OptionalNull_: Codable, BundelPath {
        
        let array: [Int]?
        let array2: [Int?]
        let boolean: Bool?
        let double: Double?
        let language: Language?
        let integer: Int?
        let object: Object?
        let object2: Object2?
        let string: String?
        
        enum CodingKeys: String, CodingKey {
            case array = "Array"
            case array2 = "Array2"
            case double = "Double"
            case boolean = "Boolean"
            case object = "Object"
            case object2 = "Object2"
            case language = "Enum"
            case integer = "Integer"
            case string = "String"
        }
        
        static func path() -> (subDic:String,file:String,ext:String) {
            return ("JSONTestData/Optional","OptionalNull","json")
        }
        
        enum Language: Int, Codable {
            case german = 0
            case english = 1
            case spanish = 2
            case french = 3
        }
        
        struct Object:Codable,Equatable{}
        
        struct Object2:Codable,Equatable{
            let string: String?
            let integer: Int?
            
            enum CodingKeys: String, CodingKey {
                case string = "Null"
                case integer = "Null_0"
            }
        }
    }
    
    
    struct OptionalValue_: Codable, BundelPath {
        
        let array: [Int]?
        let boolean: Bool?
        let double: Double?
        let language: Language?
        let integer: Int?
        let object: Object?
        let object2: Object2?
        let string: String?
        
        enum CodingKeys: String, CodingKey {
            case array = "Array"
            case boolean = "Boolean"
            case double = "Double"
            case language = "Enum"
            case integer = "Integer"
            case object = "Object"
            case object2 = "Object2"
            case string = "String"
        }
        
        static func path() -> (subDic:String,file:String,ext:String) {
            return ("JSONTestData/Optional","OptionalValue","json")
        }
        
        enum Language: Int, Codable {
            case german = 0
            case english = 1
            case spanish = 2
            case french = 3
        }
        
        struct Object:Codable,Equatable{}
        
        struct Object2:Codable,Equatable{
            let array: [Int?]
            let boolean: Bool?
            let integer: Int?
            let null_: Int?
            let string:String?
            
            enum CodingKeys: String, CodingKey {
                case array = "Array"
                case boolean = "Boolean"
                case integer = "Integer"
                case null_ = "Null"
                case string = "String"
            }
        }
    }
    
    struct DictionaryNull_: Codable, BundelPath{
        let array: [String:[Int]?]
        let array2: [String:[Int?]]
        let dictionary: [String:[String:Int]?]
        let integer: [String:Int?]
        
        enum CodingKeys: String, CodingKey{
            case array = "Array"
            case array2 = "Array_2"
            case dictionary = "Dictionary"
            case integer = "Integer"
        }
        
        
        static func path() -> (subDic:String,file:String,ext:String) {
            return ("JSONTestData/Optional","DictionaryNull","json")
        }
    }
    
    struct DictionaryValue_: Codable, BundelPath{
        let array: [String:[Int]?]
        let array2: [String:[Int?]]
        let dictionary: [String:[String:Int]?]
        let integer: [String:Int?]
        
        enum CodingKeys: String, CodingKey{
            case array = "Array"
            case array2 = "Array_2"
            case dictionary = "Dictionary"
            case integer = "Integer"
        }
        
        
        static func path() -> (subDic:String,file:String,ext:String) {
            return ("JSONTestData/Optional","DictionaryValue","json")
        }
    }
}
