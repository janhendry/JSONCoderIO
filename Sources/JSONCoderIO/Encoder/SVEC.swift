//
//  SEC.swift
//  SwiftIORest_App
//
//  Created by Jan Anstipp on 18.10.20.
//

extension JSONEncoderIO{
    
    struct SVEC:  SingleValueEncodingContainer {
        var codingPath: [CodingKey] = []
        var codingPathS: [String] = []
        var data: EncoderData
        let isDebug = false
        
        init(_ data: inout EncoderData ,_ codingPath: [String]) {
            self.data = data
            self.codingPathS = codingPath
        }
        
        private func addValue(_ value: Any) throws {
            try data.addItem(codingPathS,value)
        }
        
        mutating func encodeNil() throws {
            try addValue(JSONNull())
        }
        
        mutating func encode(_ value: Bool) throws {
            try addValue(value)
        }
        
        mutating func encode(_ value: String) throws {
            try addValue(value)
        }
        
        mutating func encode(_ value: Double) throws {
            try addValue(value)
        }
        
        mutating func encode(_ value: Float) throws {
            try addValue(value)
        }
        
        mutating func encode(_ value: Int) throws {
            try addValue(value)
        }
        
        mutating func encode(_ value: Int8) throws {
            try addValue(value)
        }
        
        mutating func encode(_ value: Int16) throws {
            try addValue(value)
        }
        
        mutating func encode(_ value: Int32) throws {
            try addValue(value)
        }
        
        mutating func encode(_ value: Int64) throws {
            try addValue(value)
        }
        
        mutating func encode(_ value: UInt) throws {
            try addValue(value)
        }
        
        mutating func encode(_ value: UInt8) throws {
            try addValue(value)
        }
        
        mutating func encode(_ value: UInt16) throws {
            try addValue(value)
        }
        
        mutating func encode(_ value: UInt32) throws {
            try addValue(value)
        }
        
        mutating func encode(_ value: UInt64) throws {
            try addValue(value)
        }
        
        mutating func encode<T>(_ value: T) throws where T : Encodable {
            try value.encode(to: JSONEncoderIO(codingPathS, &data))
        }
    }
}
