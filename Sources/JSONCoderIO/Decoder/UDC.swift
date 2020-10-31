//
//  UDC.swift
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
        
        mutating private func next() throws -> Any{
            if count ?? 0 <= currentIndex{
                throw DecodingError.arrayIndexFail(codingPath.appending(key: JSONKey(intValue: currentIndex)).path())
            }
            let object = element[currentIndex]
            currentIndex+=1
            if count ?? 0 <= currentIndex{
                isAtEnd = true
            }
            return object
        }
        
        mutating private func decodeValue<T>(_ typ: T.Type) throws -> T{
           let object = try next()
            guard let value = object as? T else {
                throw DecodingError.invadlideType(codingPath.appending(key: JSONKey(intValue: currentIndex-1)).path())
            }
            return value
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
            let object = try next()
            if let double = JSONDecoderIO.getDouble(object){
                return double
            }
            throw DecodingError.invadlideType(codingPath.appending(key: JSONKey(intValue: currentIndex-1)).path())
        }
        
        mutating func decode(_ type: Float.Type) throws -> Float {
            let object = try next()
            if let float = JSONDecoderIO.getFloat(object){
                return float
            }
            throw DecodingError.invadlideType(codingPath.appending(key: JSONKey(intValue: currentIndex-1)).path())
        }
        
        mutating func decode<T>(_ type: T.Type) throws -> T where T : Decodable {
            let object = try next()
            return try T(from: JSONDecoderIO(object, codingPath: codingPath.appending(key: JSONKey(intValue: currentIndex-1))) )
        }
        
        mutating func decodeNil() throws -> Bool {
            let object = try next()
            if let _  = object as? JSONNull {
                return true
            }
            if case Optional<Any>.none = object {
                return true
            }
            return false
            
        }
        
        mutating func nestedContainer<NestedKey>(keyedBy type: NestedKey.Type) throws -> KeyedDecodingContainer<NestedKey> where NestedKey : CodingKey {
            let object = try next()
            guard let dic = object as? [String:Any] else {
                throw DecodingError.invadlideKeyedContainer(codingPath.appending(key: JSONKey(intValue: currentIndex-1)).path())
            }
            return KeyedDecodingContainer(JSONDecoderIO.KDC(dic, codingPath.appending(key: JSONKey(intValue: currentIndex-1))))
        }
        
        mutating func nestedUnkeyedContainer() throws -> UnkeyedDecodingContainer {
            let object = try next()
            guard let array = object as? [Any] else {
                throw DecodingError.invadlideUnkedContainer(codingPath.appending(key: JSONKey(intValue: currentIndex-1)).path())
            }
            return try JSONDecoderIO.UDC(array, codingPath.appending(key: JSONKey(intValue: currentIndex-1)))
        }
        
        mutating func superDecoder() throws -> Decoder {
            let object = try next()
            return JSONDecoderIO(object, codingPath: codingPath.appending(key: JSONKey(intValue: currentIndex-1)))
        }
    }
}

