//
//  KVEC.swift
//
//  Created by Jan Anstipp on 18.10.20.
//


extension JSONEncoderIO{
    
    struct KEC<Key: CodingKey>: KeyedEncodingContainerProtocol {
        
        let isDebug = false
        var codingPath: [CodingKey]
        
        var data: EncoderData
        
        init(_ data: inout EncoderData,_ codingPath: [CodingKey]) {
            self.data = data
            self.codingPath = codingPath
            try! self.data.addDic(codingPath.path())
        }
        
        private func addValue(_ value: Any,_ key: Key) throws {
            try data.addDicItem(codingPath.path(), key: key.stringValue, value: value)
        }
        
        mutating func encodeNil(forKey key: Key) throws {
            try addValue(JSONNull(),key)
        }
        
        mutating func encode(_ value: Bool, forKey key: Key) throws {
            try addValue(value, key)
        }
        
        mutating func encode(_ value: String, forKey key: Key) throws {
            try addValue(value, key)
        }
        
        mutating func encode(_ value: Double, forKey key: Key) throws {
            try addValue(value, key)
        }
        
        mutating func encode(_ value: Float, forKey key: Key) throws {
            try addValue(value, key)
        }
        
        mutating func encode(_ value: Int, forKey key: Key) throws {
            try addValue(value, key)
        }
        
        mutating func encode(_ value: Int8, forKey key: Key) throws {
            try addValue(value, key)
        }
        
        mutating func encode(_ value: Int16, forKey key: Key) throws {
            try addValue(value, key)
        }
        
        mutating func encode(_ value: Int32, forKey key: Key) throws {
            try addValue(value, key)
        }
        
        mutating func encode(_ value: Int64, forKey key: Key) throws {
            try addValue(value, key)
        }
        
        mutating func encode(_ value: UInt, forKey key: Key) throws {
            try addValue(value, key)
        }
        
        mutating func encode(_ value: UInt8, forKey key: Key) throws {
            try addValue(value, key)
        }
        
        mutating func encode(_ value: UInt16, forKey key: Key) throws {
            try addValue(value, key)
        }
        
        mutating func encode(_ value: UInt32, forKey key: Key) throws {
            try addValue(value, key)
        }
        
        mutating func encode(_ value: UInt64, forKey key: Key) throws {
            try addValue(value, key)
        }
        
        mutating func encode<T>(_ value: T, forKey key: Key) throws where T : Encodable {
            try data.addLink(codingPath.path(), key.stringValue)
            try value.encode(to: JSONEncoderIO(codingPath.appending(key: key), &data))
        }
        
        
    }
}

