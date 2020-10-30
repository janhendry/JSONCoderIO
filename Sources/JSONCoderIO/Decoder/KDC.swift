//
//  KDC.swift
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
        
        func decode(_ type: Bool.Type, forKey key: Key) throws -> Bool {
            return try decodeValue(type,key)
        }
        
        func decode(_ type: String.Type, forKey key: Key) throws -> String {
            return try decodeValue(type,key)
        }
        
        func decode(_ type: Int.Type, forKey key: Key) throws -> Int {
            return try decodeValue(type, key)
        }
        
        func decode(_ type: Int8.Type, forKey key: Key) throws -> Int8 {
            let int = try decodeValue(Int.self, key)
            return Int8(int)
        }
        
        func decode(_ type: Int16.Type, forKey key: Key) throws -> Int16 {
            let int = try decodeValue(Int.self, key)
            return Int16(int)
        }
        
        func decode(_ type: Int32.Type, forKey key: Key) throws -> Int32 {
            let int = try decodeValue(Int.self, key)
            return Int32(int)
        }
        
        func decode(_ type: Int64.Type, forKey key: Key) throws -> Int64 {
            let int = try decodeValue(Int.self, key)
            let int64 = Int64(int)
            return int64
        }
        
        func decode(_ type: UInt.Type, forKey key: Key) throws -> UInt {
            let int = try decodeValue(String.self, key)
            if let uInt = UInt(int){
                return uInt
            }
            throw DecodingError.invadlideType(codingPath.appending(key: key).path())
        }
        
        func decode(_ type: UInt8.Type, forKey key: Key) throws -> UInt8 {
            let int = try decodeValue(Int.self, key)
            return UInt8(int)
        }
        
        func decode(_ type: UInt16.Type, forKey key: Key) throws -> UInt16 {
            let int = try decodeValue(Int.self, key)
            return UInt16(int)
        }
        
        func decode(_ type: UInt32.Type, forKey key: Key) throws -> UInt32 {
            let int = try decodeValue(Int.self, key)
            return UInt32(int)
        }
        
        func decode(_ type: UInt64.Type, forKey key: Key) throws -> UInt64 {
            let int = try decodeValue(String.self, key)
            if let uInt64 = UInt64(int){
                return uInt64
            }
            throw DecodingError.invadlideType(codingPath.appending(key: key).path())
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
