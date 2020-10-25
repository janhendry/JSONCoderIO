//
//  UVEC.swift
//  SwiftIORest_App
//
//  Created by Jan Anstipp on 18.10.20.
//

extension JSONEncoderIO{
    
    struct UEC: UnkeyedEncodingContainer {
        
        var codingPath: [CodingKey] = []
        var codingPathS: [String] = []
        var data: EncoderData
        var count: Int = 0
        let isDebug = false
        
        init(_ data: inout EncoderData,_ codingPath: [String]) {
            self.data = data
            self.codingPathS = codingPath
        }
        
        mutating private func addValue(_ value: Any) throws {
            try data.addArray(codingPathS)
            count += 1
            if case Optional<Any>.none = value{
                try data.addArrayItem(codingPathS, JSONNull())
                return
            }
            try data.addArrayItem(codingPathS, value)
        }
        
        mutating func encodeNil() throws {
            try addValue(JSONNull())
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
        
        mutating func encode(_ value: Int?) throws {
            try addValue(JSONNull())
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
        
        mutating func encode(_ value: Bool) throws{
            try addValue(value)
        }
        
        
        mutating func encode<T>(_ value: T) throws where T : Encodable {
            let mirror = Mirror(reflecting: value)
        
//            print(mirror.displayStyle)
            switch mirror.displayStyle {
                case .struct:
                    if mirror.children.count == 0{
                        try addValue([String:Any]())
                    }else {
                        let path = codingPathS.appending(count: count)
                        try data.addArray(codingPathS)
                        try data.addLink(codingPathS,String(count))
                        
                        count += 1
                        try value.encode(to: JSONEncoderIO(path, &data))
                       
                    }
                case .collection:
                    if let array = value as? [Any], array.isEmpty{
                        try addValue(value)
                    }else {
                        let path = codingPathS.appending(key:"\(count)")
                        count += 1
                        try data.addArray(path)
                        try value.encode(to: JSONEncoderIO(path, &data))
                    }
                case .enum:
//                    let path = codingPathS.appending(key:"\(count)")
                    
                    try data.addArray(codingPathS)
//                    try data.addLink(codingPathS, String(count))
                    count += 1
                    try value.encode(to: JSONEncoderIO(codingPathS, &data))
                default:
                    try addValue(value)
            }
        }
        
    }
}
