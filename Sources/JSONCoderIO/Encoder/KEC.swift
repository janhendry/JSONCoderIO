//
//  KVEC.swift
//  SwiftIORest_App
//
//  Created by Jan Anstipp on 18.10.20.
//


extension JSONEncoderIO{
    
    struct KEC<Key: CodingKey>: KeyedEncodingContainerProtocol {
        
        let isDebug = false
        var codingPath: [CodingKey] = []
        var codingPathS: [String] = []
        
        var data: EncoderData
        
        init(_ data: inout EncoderData,_ codingPath: [String]) {
            self.data = data
            self.codingPathS = codingPath
        }
        
        private func addValue(_ value: Any?,_ key: Key) throws {
            let newValue = (value == nil) ? JSONNull() : value!
            try data.addDic(codingPathS)
            try data.addDicItem(codingPathS, key: key.stringValue, value: newValue)
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
            let mirror = Mirror(reflecting: value)
//            print(mirror.displayStyle)
            switch mirror.displayStyle {
                case .struct, .class:
                    if mirror.children.count == 0 {
                        try addValue([String:Any](),key)
                    }else{
                        try data.addDic(codingPathS)
                        try data.addLink(codingPathS, key.stringValue)
                        try value.encode(to: JSONEncoderIO(codingPathS.appending(key: key), &data))
                    }
                case .enum:
                    try data.addDic(codingPathS)
                    try value.encode(to: JSONEncoderIO(codingPathS.appending(key: key), &data))
                // case .tuple:
                //
                // case .optional:
                //
                // case .set:
                case .collection:
                    if mirror.children.count == 0 {
                        try addValue([Any](),key)
                    }else{
                        try data.addDic(codingPathS)
                        try data.addLink(codingPathS, key.stringValue)
                        try value.encode(to: JSONEncoderIO(codingPathS.appending(key: key), &data))
                    }
                case .dictionary:
                    if mirror.children.count == 0 {
                        try addValue([String:Any](),key)
                    }else{
                        try data.addDic(codingPathS)
                        try data.addLink(codingPathS, key.stringValue)
                        try value.encode(to: JSONEncoderIO(codingPathS.appending(key: key), &data))
                    }
                default:
                    try data.addDic(codingPathS)
                    try value.encode(to: JSONEncoderIO(codingPathS.appending(key: key), &data))
            }
        }
        
        mutating func encodeIfPresent(_ value: Bool?, forKey key: Key) throws{
            try addValue(value, key)
        }
        
        mutating func encodeIfPresent(_ value: String?, forKey key: Key) throws{
            try addValue(value, key)
        }
        
        mutating func encodeIfPresent(_ value: Double?, forKey key: Key) throws{
            try addValue(value, key)
        }
        
        mutating func encodeIfPresent(_ value: Float?, forKey key: Key) throws{
            try addValue(value, key)
        }
        
        mutating func encodeIfPresent(_ value: Int?, forKey key: Key) throws{
            try addValue(value, key)
        }
        
        mutating func encodeIfPresent(_ value: Int8?, forKey key: Key) throws{
            try addValue(value, key)
        }
        
        mutating func encodeIfPresent(_ value: Int16?, forKey key: Key) throws{
            try addValue(value, key)
        }
        
        mutating func encodeIfPresent(_ value: Int32?, forKey key: Key) throws{
            try addValue(value, key)
        }
        
        mutating func encodeIfPresent(_ value: Int64?, forKey key: Key) throws{
            try addValue(value, key)
        }
        
        mutating func encodeIfPresent(_ value: UInt?, forKey key: Key) throws{
            try addValue(value, key)
        }
        
        mutating func encodeIfPresent(_ value: UInt8?, forKey key: Key) throws{
            try addValue(value, key)
        }
        
        mutating func encodeIfPresent(_ value: UInt16?, forKey key: Key) throws{
            try addValue(value, key)
        }
        
        mutating func encodeIfPresent(_ value: UInt32?, forKey key: Key) throws{
            try addValue(value, key)
        }
        
        mutating func encodeIfPresent(_ value: UInt64?, forKey key: Key) throws{
            try addValue(value, key)
        }
        
        mutating func encodeIfPresent<T>(_ value: T?, forKey key: Key) throws where T: Encodable{
            try addValue(value, key)
        }
        
    }
}

