//
//  ContainerAny.swift
//
//  Created by Jan Anstipp on 13.10.20.
//

extension JSONDecoderIO{
    struct SVDC: SingleValueDecodingContainer {
        
        let isDebug = false
        
        var codingPath: [CodingKey]
        let element: Any
        
        init(_ element: Any,_ codingPath: [CodingKey]) {
            self.element = element
            self.codingPath = codingPath
        }
        
        private func decodeValue<T>(_ typ: T.Type) throws -> T{
            guard let object = element as? T else {
                throw DecodingError.invadlideType(codingPath.path())
            }
            return object
        }
        
        func decode(_ type: Bool.Type) throws -> Bool {
            return try decodeValue(type)
        }
        
        func decode(_ type: String.Type) throws -> String {
            return try decodeValue(type)
        }
        
        func decode(_ type: Int.Type) throws -> Int {
            return try decodeValue(type)
        }
        
        func decode(_ type: Int8.Type) throws -> Int8 {
            let int = try decode(Int.self)
            return Int8(int)
        }
        
        func decode(_ type: Int16.Type) throws -> Int16 {
            let int = try decode(Int.self)
            return Int16(int)
        }
        
        func decode(_ type: Int32.Type) throws -> Int32 {
            let int = try decode(Int.self)
            return Int32(int)
        }
        
        func decode(_ type: Int64.Type) throws -> Int64 {
            let int = try decode(Int.self)
            return Int64(int)
        }
        
        func decode(_ type: UInt.Type) throws -> UInt {
            let int = try decode(String.self)
            if let uInt = UInt(int){
                return uInt
            }
            throw DecodingError.invadlideType(codingPath.path())
        }
        
        func decode(_ type: UInt8.Type) throws -> UInt8 {
            let int = try decode(Int.self)
            return UInt8(int)
        }
        
        func decode(_ type: UInt16.Type) throws -> UInt16 {
            let int = try decode(Int.self)
            return UInt16(int)
        }
        
        func decode(_ type: UInt32.Type) throws -> UInt32 {
            let int = try decode(Int.self)
            return UInt32(int)
        }
        
        func decode(_ type: UInt64.Type) throws -> UInt64 {
            let int = try decodeValue(String.self)
            if let uInt64 = UInt64(int){
                return uInt64
            }
            throw DecodingError.invadlideType(codingPath.path())
        }
        
        func decode(_ type: Double.Type) throws -> Double {
            if let double = JSONDecoderIO.getDouble(element){
                return double
            }
            throw DecodingError.invadlideType(codingPath.path())
        }
        
        func decode(_ type: Float.Type) throws -> Float {
            if let float = JSONDecoderIO.getFloat(element){
                return float
            }
            throw DecodingError.invadlideType(codingPath.path())
        }
        
        func decode<T>(_ type: T.Type) throws -> T where T : Decodable {
            return try T(from: JSONDecoderIO(element,codingPath: codingPath))
        }
        
        func decodeNil() -> Bool {
            if let _  = element as? JSONNull {
                return true
            }
            if case Optional<Any>.none = element {
                return true
            }
            return false
            
        }
    }
}
