//
//  UDC.swift
//  SwiftIORest_App
//
//  Created by Jan Anstipp on 14.10.20.
//
extension JSONDecoderIO{
    
    struct UDC: UnkeyedDecodingContainer {
        
        let isDebug = false
        
        var codingPath: [CodingKey]
        var count: Int?
        var isAtEnd: Bool = false
        var currentIndex: Int = 0
        
        let element: [Any]
        
        init(_ element: [Any],_ codingPath: [CodingKey] ) throws {
            self.element = element
            self.codingPath = codingPath
            count = self.element.count
            if count == 0 { isAtEnd = true }
        }
        
        mutating private func decodeValue<T>(_ typ: T.Type) throws -> T{
            if count ?? 0 <= currentIndex{
                throw DecodingError.arrayIndexFail(codingPath.path())
            }
            let object = element[currentIndex]
            currentIndex+=1
            if count ?? 0 <= currentIndex{
                isAtEnd = true
            }
            guard let value = object as? T else {
                throw DecodingError.invadlideType(codingPath.path())
            }
            return value
        }
        
        func decodeDic<K>(_ dic: Dictionary<String,K>) -> Dictionary<String,K> where K : Decodable{
            return [:]
        }
        
        mutating func decode(_ type: Bool.Type) throws -> Bool {
            return try decodeValue(type)
        }
        
        mutating func decode(_ type: String.Type) throws -> String {
            return try decodeValue(type)
        }
        
        mutating func decode(_ type: Int.Type) throws -> Int {
            return try decodeValue(type)
        }
        
        mutating func decode(_ type: Double.Type) throws -> Double {
            if count ?? 0 <= currentIndex{
                throw DecodingError.arrayIndexFail(codingPath.path())
            }
            let object = element[currentIndex]
            currentIndex+=1
            if count ?? 0 <= currentIndex{
                isAtEnd = true
            }
            if let double = JSONDecoderIO.getDouble(object){
                return double
            }
            throw DecodingError.invadlideType(codingPath.path())
        }
        
        mutating func decode(_ type: Float.Type) throws -> Float {
            if count ?? 0 <= currentIndex{
                throw DecodingError.arrayIndexFail(codingPath.path())
            }
            let object = element[currentIndex]
            currentIndex+=1
            if count ?? 0 <= currentIndex{
                isAtEnd = true
            }
            if let float = JSONDecoderIO.getFloat(object){
                return float
            }
            throw DecodingError.invadlideType(codingPath.path())
        }
        
        mutating func decode<T>(_ type: T.Type) throws -> T where T : Decodable {
            if count ?? 0 <= currentIndex{
                throw DecodingError.arrayIndexFail(codingPath.path())
            }
            let object = element[currentIndex]
            currentIndex+=1
            if count ?? 0 <= currentIndex{
                isAtEnd = true
            }
            return try T(from: JSONDecoderIO(object, codingPath: codingPath) )
        }
        
        mutating func decodeNil() throws -> Bool {
            if count ?? 0 <= currentIndex{
                throw DecodingError.arrayIndexFail(codingPath.path())
            }
            let object = element[currentIndex]
            currentIndex+=1
            if count ?? 0 <= currentIndex{
                isAtEnd = true
            }
            if let _  = object as? JSONNull {
                return true
            }
            if case Optional<Any>.none = object {
                return true
            }
            return false
            
        }
        
    }
}

