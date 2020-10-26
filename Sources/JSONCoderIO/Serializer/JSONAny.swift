//
//  JSONAny.swift
//  SwiftIORest_App
//
//  Created by Jan Anstipp on 14.10.20.
//

class JSONAny{

    static func decode(data: JSONObject) -> Any?{
        switch data{
        case let object as JSONArray :
            let array = object.elements.map{ decode(data: $0) }
            return array
        case let object as JSONString :
            return object.s_value
        case let object as JSONBool :
            return object.b_value
        case _ as JSONNull :
            return nil
//            return JSONNull(
        case let object as JSONDouble:
            return object.numberValue
        case let object as JSONFloat:
            return object.numberValue
        case let object as JSONNumber :
            return object.numberValue
        default:
//            return data.unbox().mapValues{ decode(data: $0) }
            
            var d: [String:Any] = [:]
            var i = 0
            while i < data.values.count && i < data.keys.count {
                let value = decode(data: data.values[i]!)
                let key = data.keys[i] as! JSONString
                d[key.s_value] = value
                i += 1
            }
            return d
        }
    }
}
