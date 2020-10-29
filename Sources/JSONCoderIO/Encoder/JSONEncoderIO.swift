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

    
    public var codingPath: [CodingKey] = []
    var codingPathS: [String] = []
    
    var sort: Sort = .alpha
    
    var data: EncoderData
    public var userInfo: [CodingUserInfoKey : Any] = [:]
   
    public init() {
        self.data = .init()
    }
    
    init(_ codingPathx: [String] = [],_ data: inout EncoderData ) {
        self.codingPathS = codingPathx
        self.data = data
    }
    
    public func container<Key>(keyedBy type: Key.Type) -> KeyedEncodingContainer<Key> where Key : CodingKey {
        return KeyedEncodingContainer(KEC(&data, codingPathS))
    }
    
    public func unkeyedContainer() -> UnkeyedEncodingContainer {
        return UEC(&data, codingPathS)
    }
    
    public func singleValueContainer() -> SingleValueEncodingContainer {
        return SVEC(&data, codingPathS)
    }
    
    public func getJson() throws -> String {
        return try data.getJSONString()
    }

}

