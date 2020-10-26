//
//  KDC.swift
//  SwiftIORest_App
//
//  Created by Jan Anstipp on 14.10.20.
//
extension JSONDecoderIO{
    struct KDC<Key: CodingKey>: KeyedDecodingContainerProtocol {
        
        
        let isDebug = false
        
        var codingPath: [CodingKey]
        var allKeys: [Key]
        let element: [String: Any]
        
        init(_ element: [String: Any], _ codingPath: [CodingKey] ) {
            self.element = element
            self.codingPath = codingPath
            allKeys = element.keys.compactMap { Key(stringValue: $0) }
        }
        
        private func decodeValue<T>(_ typ: T.Type,_ key: CodingKey) throws -> T{
            guard let object = element[key.stringValue] else {
                throw DecodingError.keyNotFound(codingPath.appending(key: key).path())
            }
            guard let value = object as? T else {
                throw DecodingError.invadlideType(codingPath.appending(key: key).path())
            }
            return value
        }
        
        private func decodeArrayValue<T>(_ typ: T.Type,_ key: CodingKey) throws -> [T]{
            guard let object = element[key.stringValue] else {
                throw DecodingError.keyNotFound(codingPath.path())
            }
            guard let value = object as? [T] else {
                throw DecodingError.valueTypinvalide(codingPath.path())
            }
            return value
        }
        
        func decode(_ type: Bool.Type, forKey key: Key) throws -> Bool {
            return try decodeValue(type,key)
        }
        
        func decode(_ type: String.Type, forKey key: Key) throws -> String {
            return try decodeValue(type,key)
        }

        func decode(_ type: Int.Type, forKey key: Key) throws -> Int {
            return try decodeValue(type,key)
        }
        
        func decode(_ type: Double.Type, forKey key: Key) throws -> Double {
            guard let object = element[key.stringValue] else {
                throw DecodingError.keyNotFound(codingPath.path())
            }
            if let double = JSONDecoderIO.getDouble(object){
                return double
            }
            throw DecodingError.invadlideType(codingPath.path())
        }
        
        func decode(_ type: Float.Type, forKey key: Key) throws -> Float {
            guard let object = element[key.stringValue] else {
                throw DecodingError.keyNotFound(codingPath.path())
            }
            if let float = JSONDecoderIO.getFloat(object){
                return float
            }
            throw DecodingError.invadlideType(codingPath.path())
        }
        
        func decode<T>(_ type: T.Type, forKey key: Key) throws -> T where T : Decodable {
            
            guard let value = element[key.stringValue] else {
                throw DecodingError.keyNotFound(codingPath.path())
            }
            
            if let array = value as? [Any], array.isEmpty{
                return value as! T
            }

            return try T(from: JSONDecoderIO(value,codingPath: codingPath.appending(key: key) ))
        }
        
        func contains(_ key: Key) -> Bool {
            if let _ = element[key.stringValue]{
                return true
            }
            return false
        }
        
        func decodeNil(forKey key: Key) throws -> Bool {
            guard let object = element[key.stringValue] else {
                throw DecodingError.keyNotFound(codingPath.appending(key: key).path())
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
