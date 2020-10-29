//
//  DecoderTODO.swift
//  
//
//  Created by Jan Anstipp on 23.10.20.
//

extension JSONDecoderIO.UDC{
    
    enum JSONDecoderIOError:Error{
        case notSupport(String)
    }
    
    mutating func nestedContainer<NestedKey>(keyedBy type: NestedKey.Type) throws -> KeyedDecodingContainer<NestedKey> where NestedKey : CodingKey {
        if isDebug {
            fatalError()
        }else {
            throw JSONDecoderIOError.notSupport("UDC: nestedContainer<NestedKey> key:\(codingPath.path())")
        }
    }
    
    mutating func nestedUnkeyedContainer() throws -> UnkeyedDecodingContainer {
        if isDebug {
            fatalError()
        }else {
            throw JSONDecoderIOError.notSupport("UDC: nestedUnkeyedContainer() key:\(codingPath.path())")
        }
    }
    
    mutating func superDecoder() throws -> Decoder {
        if isDebug {
            fatalError()
        }else {
            throw JSONDecoderIOError.notSupport("UDC: superDecoder() key:\(codingPath.path())")
        }
    }
    
}

extension JSONDecoderIO.KDC{
    
    enum JSONDecoderIOError:Error{
        case notSupport(String)
    }
    
    func nestedContainer<NestedKey>(keyedBy type: NestedKey.Type, forKey key: Key) throws -> KeyedDecodingContainer<NestedKey> where NestedKey : CodingKey {
        if isDebug {
            fatalError()
        }else {
            throw JSONDecoderIOError.notSupport("KDC: nestedContainer<NestedKey> key:\(codingPath.appending(key: key).path())")
        }
    }
    
    func nestedUnkeyedContainer(forKey key: Key) throws -> UnkeyedDecodingContainer {
        if isDebug {
            fatalError()
        }else {
            throw JSONDecoderIOError.notSupport("KDC: nestedUnkeyedContainer(forKey key: Key) key:\(codingPath.appending(key: key).path())")
        }
    }
    
    func superDecoder() throws -> Decoder {
        if isDebug {
            fatalError()
        }else {
            throw JSONDecoderIOError.notSupport("KDC: superDecoder() key:\(codingPath.path())")
        }
    }
    
    func superDecoder(forKey key: Key) throws -> Decoder {
        if isDebug {
            fatalError()
        }else {
            throw JSONDecoderIOError.notSupport("KDC: superDecoder(forKey key: Key) key:\(codingPath.appending(key: key).path())")
        }
    }
    
}
