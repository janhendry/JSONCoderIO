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
    
    mutating func encodeConditional<T>(_ object: T, forKey key: Key) throws where T: AnyObject, T:Encodable{
        
        if isDebug {
            fatalError()
        }else {
            throw JSONEncoderIOError.notSupport("KEC: encodeConditional<\(T.self)>  key:\(codingPath.appending(key: key).path())")
        }
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
    
    mutating func encode<T>(contentsOf sequence: T) throws where T : Sequence, T.Element == String{
        if isDebug {
            fatalError()
        }else {
            throw JSONEncoderIOError.notSupport("UEC: encode<\(T.self)>(contentsOf sequence: T) key:\(codingPath.path())")
        }
    }
    
    mutating func encode<T>(contentsOf sequence: T) throws where T : Sequence, T.Element : Encodable{
        if isDebug {
            fatalError()
        }else {
            throw JSONEncoderIOError.notSupport("UEC: encode<\(T.self)>(contentsOf sequence: T) key:\(codingPath.path())")
        }
    }
    
    mutating func encode<T>(contentsOf sequence: T) throws where T : Sequence, T.Element == Bool{
        if isDebug {
            fatalError()
        }else {
            throw JSONEncoderIOError.notSupport("UEC: encode<\(T.self)>(contentsOf sequence: T) key:\(codingPath.path())")
        }
    }
    
    mutating func encode<T>(contentsOf sequence: T) throws where T : Sequence, T.Element == Double{
        if isDebug {
            fatalError()
        }else {
            throw JSONEncoderIOError.notSupport("UEC: encode<\(T.self)>(contentsOf sequence: T) key:\(codingPath.path())")
        }
    }
    
    mutating func encode<T>(contentsOf sequence: T) throws where T : Sequence, T.Element == Float{
        if isDebug {
            fatalError()
        }else {
            throw JSONEncoderIOError.notSupport("UEC: encode<\(T.self)>(contentsOf sequence: T) key:\(codingPath.path())")
        }
    }
    
    mutating func encode<T>(contentsOf sequence: T) throws where T : Sequence, T.Element == Int{
        if isDebug {
            fatalError()
        }else {
            throw JSONEncoderIOError.notSupport("UEC: encode<\(T.self)>(contentsOf sequence: T) key:\(codingPath.path())")
        }
    }
    
    mutating func encode<T>(contentsOf sequence: T) throws where T : Sequence, T.Element == Int?{
        if isDebug {
            fatalError()
        }else {
            throw JSONEncoderIOError.notSupport("UEC: encode<\(T.self)>(contentsOf sequence: T) key:\(codingPath.path())")
        }
    }
    
    mutating func encode<T>(contentsOf sequence: T) throws where T : Sequence, T.Element == UInt{
        if isDebug {
            fatalError()
        }else {
            throw JSONEncoderIOError.notSupport("UEC: encode<\(T.self)>(contentsOf sequence: T) key:\(codingPath.path())")
        }
    }
    mutating func encode<T>(contentsOf sequence: T) throws where T : Sequence, T.Element == Int8{
        if isDebug {
            fatalError()
        }else {
            throw JSONEncoderIOError.notSupport("UEC: encode<\(T.self)>(contentsOf sequence: T) key:\(codingPath.path())")
        }
    }
    mutating func encode<T>(contentsOf sequence: T) throws where T : Sequence, T.Element == Int16{
        if isDebug {
            fatalError()
        }else {
            throw JSONEncoderIOError.notSupport("UEC: encode<\(T.self)>(contentsOf sequence: T) key:\(codingPath.path())")
        }
    }
    mutating func encode<T>(contentsOf sequence: T) throws where T : Sequence, T.Element == Int32{
        if isDebug {
            fatalError()
        }else {
            throw JSONEncoderIOError.notSupport("UEC: encode<\(T.self)>(contentsOf sequence: T) key:\(codingPath.path())")
        }
    }
    mutating func encode<T>(contentsOf sequence: T) throws where T : Sequence, T.Element == Int64{
        if isDebug {
            fatalError()
        }else {
            throw JSONEncoderIOError.notSupport("UEC: encode<\(T.self)>(contentsOf sequence: T) key:\(codingPath.path())")
        }
    }
    mutating func encode<T>(contentsOf sequence: T) throws where T : Sequence, T.Element == UInt8{
        if isDebug {
            fatalError()
        }else {
            throw JSONEncoderIOError.notSupport("UEC: encode<\(T.self)>(contentsOf sequence: T) key:\(codingPath.path())")
        }
    }
    mutating func encode<T>(contentsOf sequence: T) throws where T : Sequence, T.Element == UInt16{
        if isDebug {
            fatalError()
        }else {
            throw JSONEncoderIOError.notSupport("UEC: encode<\(T.self)>(contentsOf sequence: T) key:\(codingPath.path())")
        }
    }
    mutating func encode<T>(contentsOf sequence: T) throws where T : Sequence, T.Element == UInt32{
        if isDebug {
            fatalError()
        }else {
            throw JSONEncoderIOError.notSupport("UEC: encode<\(T.self)>(contentsOf sequence: T) key:\(codingPath.path())")
        }
    }
    mutating func encode<T>(contentsOf sequence: T) throws where T : Sequence, T.Element == UInt64{
        if isDebug {
            fatalError()
        }else {
            throw JSONEncoderIOError.notSupport("UEC: encode<\(T.self)>(contentsOf sequence: T) key:\(codingPath.path())")
        }
    }
    mutating func encodeConditional<T>(_ object: T) throws where T : AnyObject, T : Encodable{
        if isDebug {
            fatalError()
        }else {
            throw JSONEncoderIOError.notSupport("UEC: encode<\(T.self)>(contentsOf sequence: T) key:\(codingPath.path())")
        }
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
