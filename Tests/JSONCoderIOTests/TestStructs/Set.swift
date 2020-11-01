//
//  File.swift
//  
//
//  Created by Jan Anstipp on 26.10.20.
//

enum Setts{
    
    struct Array_: Codable, BundelPath{
        let array: Set<[Int]>

        enum CodingKeys: String, CodingKey {
            case array = "Array"
        }
        
        static func path() -> (subDic:String,file:String,ext:String) {
            return ("JSONTestData/Set","Array","json")
        }
    }

    struct ArrayIntOptional_: Codable, BundelPath {
        let array: Set<[Int?]>

        enum CodingKeys: String, CodingKey {
            case array = "Array"
        }
        static func path() -> (subDic:String,file:String,ext:String) {
            return ("JSONTestData/Set","ArrayIntOptional","json")
        }
    }

    struct ArrayOptional_: Codable, BundelPath {
        let array: Set<[Int]?>

        enum CodingKeys: String, CodingKey {
            case array = "Array"
        }
        static func path() -> (subDic:String,file:String,ext:String) {
            return ("JSONTestData/Set","ArrayOptional","json")
        }
    }
    
    struct Dictionary_: Codable, BundelPath {
        let array: Set<[String:Int]>

        enum CodingKeys: String, CodingKey {
            case array = "Array"
        }
        static func path() -> (subDic:String,file:String,ext:String) {
            return ("JSONTestData/Set","Dictionary","json")
        }
    }
    
    struct DictionaryArray_: Codable, BundelPath {
        let array: Set<[String:[Int]]>

        enum CodingKeys: String, CodingKey {
            case array = "Array"
        }
        static func path() -> (subDic:String,file:String,ext:String) {
            return ("JSONTestData/Set","DictionaryArray","json")
        }
    }
    
    struct Integer_: Codable, BundelPath {
        let integer: Set<Int>

        enum CodingKeys: String, CodingKey {
            case integer = "Integer"
        }
        static func path() -> (subDic:String,file:String,ext:String) {
            return ("JSONTestData/Set","Integer","json")
        }
    }

    struct IntegerOptional_: Codable, BundelPath {
        let intOptional: Set<Int?>

        enum CodingKeys: String, CodingKey {
            case intOptional = "IntOptional"
        }
        static func path() -> (subDic:String,file:String,ext:String) {
            return ("JSONTestData/Set","IntegerOptional","json")
        }
    }
    
    struct Optional: Codable, BundelPath {
        let optional: Int?

        enum CodingKeys: String, CodingKey {
            case optional = "Optional"
        }
        static func path() -> (subDic:String,file:String,ext:String) {
            return ("JSONTestData/Set","Optional","json")
        }
    }


}
