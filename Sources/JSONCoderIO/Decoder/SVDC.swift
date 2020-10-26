//
//  ContainerAny.swift
//  SwiftIORest_App
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
