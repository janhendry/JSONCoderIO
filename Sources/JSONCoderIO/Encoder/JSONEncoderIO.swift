//
//  JSONEncoderIO.swift
//
//  Created by Jan Anstipp on 18.10.20.
//

enum Sort{
    case keys
    case alpha
}

public class JSONEncoderIO: Encoder{

    
    public var codingPath: [CodingKey]
    var sort: Sort = .alpha
    
    var data: EncoderData
    public var userInfo: [CodingUserInfoKey : Any] = [:]
   
    public init() {
        self.data = .init()
        codingPath = []
    }
    
    init(_ codingPath: [CodingKey] = [],_ data: inout EncoderData ) {
        self.codingPath = codingPath
        self.data = data
    }
    
    public func container<Key>(keyedBy type: Key.Type) -> KeyedEncodingContainer<Key> where Key : CodingKey {
        return KeyedEncodingContainer(KEC(&data, codingPath))
    }
    
    public func unkeyedContainer() -> UnkeyedEncodingContainer {
        return UEC(&data, codingPath)
    }
    
    public func singleValueContainer() -> SingleValueEncodingContainer {
        return SVEC(&data, codingPath)
    }
    
    public func getJson() throws -> String {
        return try data.getJSONString()
    }

}

