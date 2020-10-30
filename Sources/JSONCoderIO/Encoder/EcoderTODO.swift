//
// EcoderTODO.swift
//  
//
//  Created by Jan Anstipp on 23.10.20.
//

extension JSONEncoderIO.KEC{
    
    enum JSONEncoderIOError:Error{
        case notSupport(String)
    }

    mutating func nestedContainer<NestedKey>(keyedBy keyType: NestedKey.Type, forKey key: Key) -> KeyedEncodingContainer<NestedKey> where NestedKey : CodingKey {
        if isDebug {
            fatalError()
        }else {
            return KeyedEncodingContainer( JSONEncoderIO.KEC(&data, codingPath.appending(key: key)))
        }
    }

    mutating func nestedUnkeyedContainer(forKey key: Key) -> UnkeyedEncodingContainer {
        if isDebug {
            fatalError()
        }else {
            return JSONEncoderIO.UEC(&data, codingPath.appending(key: key))
        }
    }

    mutating func superEncoder() -> Encoder {
        if isDebug {
            fatalError()
        }else {
            return JSONEncoderIO()
        }
    }

    mutating func superEncoder(forKey key: Key) -> Encoder {
        if isDebug {
            fatalError()
        }else {
            return JSONEncoderIO()
        }
    }
    
}

extension JSONEncoderIO.UEC{
    enum JSONEncoderIOError:Error{
        case notSupport(String)
    }
    
   
    mutating func nestedContainer<NestedKey>(keyedBy keyType: NestedKey.Type) -> KeyedEncodingContainer<NestedKey> where NestedKey : CodingKey {
        if isDebug {
            fatalError()
        }else {
            return KeyedEncodingContainer( JSONEncoderIO.KEC(&data, codingPath))
        }
    }
    
    mutating func nestedUnkeyedContainer() -> UnkeyedEncodingContainer {
        if isDebug {
            fatalError()
        }else {
            return JSONEncoderIO.UEC(&data, codingPath)
        }
    }
    
    mutating func superEncoder() -> Encoder {
        if isDebug {
            fatalError()
        }else {
            return JSONEncoderIO()
        }
    }
}
