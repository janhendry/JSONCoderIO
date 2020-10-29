//
//  EncoderData.swift
//  
//
//  Created by Jan Anstipp on 23.10.20.
//


class EncoderData {
    
    private var data: [[String]:Any] = [:]
    
    var sort: Sort = .alpha
    
    func addArray(_ key:[String]) throws {
        if let _ = data[key] as? [Any] {
            return
        }
        if data.keys.contains(key) {
            throw EncoderStorageError.invalidArray(key.joined(separator: "."))
        }
        data[key] = []
    }
    
    func addDic(_ key:[String]) throws {
        if let _ = data[key] as? DataDic {
            return
        }
        if let _ = data[key] as? [Any] {
            return
        }
        if data.keys.contains(key) {
            throw EncoderStorageError.invalidDic(key.joined(separator: "."))
        }
        data[key] = DataDic()
    }
    
    func addLink(_ dicKey:[String] ,_ key: String) throws {
        
        if var dic = data[dicKey] as? DataDic {
            dic.add(key,Link(path: dicKey, key: key))
            data[dicKey] = dic
            return
        }

        if var dic = data[dicKey] as? [Any] {
            dic.append(Link(path: dicKey, key: key))
            data[dicKey] = dic
            return
        }

        throw EncoderStorageError.invalidLink(dicKey.joined(separator: ".") + key)
    }
    
   
    func addDicItem(_ dicKey:[String], key:String , value:Any ) throws {
        guard var dic = data[dicKey] as? DataDic else {
            throw EncoderStorageError.invalidDicItem(dicKey.joined(separator: ".") + key)
        }
        dic.add(key, value)
        data[dicKey] = dic
    }
    
    func addArrayItem(_ key:[String],_ value: Any) throws {
        guard var array = data[key] as? [Any] else{
            throw EncoderStorageError.invalidArrayItem(key.joined(separator: "."))
        }
        array.append(value)
        data[key] = array
    }
    
    func addItem(_ key:[String],_ value: Any) throws {
        if nil != (try? addArrayItem(key, value)){
            return
        }
        
        if nil != (try? addDicItem(key.dropLast(), key: key.last!, value: value)){
            return
        }
        throw EncoderStorageError.invalidItem(key.joined(separator: "."))
    }
    
    func print(){
        _ = data.map{ Swift.print($0) }
    }
    
    
    func getJSONString() throws ->  String {
        if let json = try? getJSON() {
            return decodeAny(json)
        }else{
            throw EncoderStorageError.toJSONStringFail
        }
    }
    
    
    func getJSON() throws ->  DataDic {
        
        let objects = data.filter{ $0.key.count == 0 }
        
        if objects.count == 0{
            return DataDic()
        }
        
        if objects.count == 1 {
            let firstValue = objects.first!.value
            let json = try decodeLink(firstValue)
            guard let jsonObject = json as? DataDic else {
                throw EncoderStorageError.firstObjectNoDictionary
            }
            return jsonObject
        }
        throw EncoderStorageError.firstObjectNoDictionary
    }
    
    
    
    private func decodeLink(_ value: Any) throws -> Any {
        switch value{
            case let object as DataDic:
                let values = try object.dic.map{ (key,value) -> (String,Any) in
                    (key,try self.decodeLink(value))
                }
                return DataDic(dic: values)
                
            case let object as [Any]:
                return try object.map{
                    try self.decodeLink($0)
                }
            case let link as Link:
                guard let x = data[link.fullpath] else {
                    throw EncoderStorageError.missingLink(link.fullpath.path())
                }
                return try decodeLink(x)
            default:
                if case Optional<Any>.none = value{
                    return JSONNull()
                }
                return value
        }
    }
    
    enum EncoderStorageError: Error{
        case firstObjectNoDictionary
        case missingLink(String)
        case invalidLink(String)
        case invalidDic(String)
        case invalidArray(String)
        case invalidDicItem(String)
        case invalidArrayItem(String)
        case invalidItem(String)
        case toJSONStringFail
    }
    
    struct DataDic{
        var dic :[(String,Any)] = []
        
        mutating func add(_ key:String,_ value:Any){
            dic.append((key,value))
        }
    }
    
    struct Link {
        var path: [String]
        var key: String
        
        var fullpath: [String] {
            var full = path
            full.append(key)
            return full
        }
        
    }
    
    func decodeAny(_ value: Any) ->String {
        switch value {
            case let dataDic as DataDic:
                var dic = dataDic.dic
                if sort == Sort.alpha{
                    dic = dic.sorted{ $0.0 < $1.0 }
                }
                let values = dic.map{ (key,value) -> String in
                    "\"\(key)\":\( decodeAny(value))"
                }
                return "{\(values.joined(separator: ","))}"
            case let dic as [String:Any]:
                let values = dic.map{ ($0.0,$0.1) }
                    .sorted{ $0.0 < $1.0 }
                    .map{ (key,value) -> String in
                        "\"\(key)\":\( decodeAny(value))"
                    }
                return "{\(values.joined(separator: ","))}"
            case let array as [Any] :
                var value = array.map{  decodeAny($0) }
                if sort == .alpha{
                    value = value.sorted{ $0 < $1 }
                }
                return "[\(array.map{  decodeAny($0) } .joined(separator: ","))]"
            case let bool as Bool:
                return bool ? "true" : "false"
            case _ as JSONNull:
                return "null"
            case let string as String:
                return "\"\(string)\""
            case let optional as OptionalProtocol:
                if optional.isSome() {
                    let result = decodeAny(optional.unwrap())
                    return result
                }else{
                    return  "Null"
                }
            default:
                return "\(value)"
        }
        
    }
    

}

protocol OptionalProtocol {
    func isSome() -> Bool
    func unwrap() -> Any
}

extension Optional : OptionalProtocol {
    func isSome() -> Bool {
        switch self {
        case .none: return false
        case .some: return true
        }
    }

    func unwrap() -> Any {
        switch self {
        case .none: preconditionFailure("trying to unwrap nil")
        case .some(let unwrapped): return unwrapped
        }
    }
    func unwrap<T>(type:T) -> T {
        switch self {
        case .none: preconditionFailure("trying to unwrap nil")
        case .some(let unwrapped): return unwrapped as! T
        }
    }
}
