//
//  DecoderAny.swift
//  SwiftIORest_App
//
//  Created by Jan Anstipp on 13.10.20.
//

enum DecodingError:Error{
    case keyNotFound(String)
    case invadlideType(String)
    case invadlideKeyedContainer(String)
    case invadlideUnkedContainer(String)
    case arrayIndexFail(String)
    case valueTypinvalide(String)
    case parsingFail(String)
}

public class JSONDecoderIO: Decoder {
    public var codingPath: [CodingKey] = []
    public var userInfo: [CodingUserInfoKey : Any] = [:]
    let element: Any
    
    public init(_ string: String) throws {
        do{
            let parser = try JSONParser(text: string).parse()
            element = parser.unbox()
        }catch{
            
            throw DecodingError.parsingFail("parsingFail")
        }
    }
    
    init(_ element: Any, codingPath: [CodingKey] = []) {
        self.element = element
        self.codingPath = codingPath
    }
    
    public func container<Key>(keyedBy type: Key.Type) throws -> KeyedDecodingContainer<Key> {
        
        guard let dic = element as? [String:Any] else {
            throw DecodingError.invadlideKeyedContainer(codingPath.path())
        }
        return KeyedDecodingContainer(KDC(dic, codingPath))
    }
    
    public func unkeyedContainer() throws -> UnkeyedDecodingContainer {
        guard let array = element as? [Any] else {
            throw DecodingError.invadlideUnkedContainer(codingPath.path())
        }
        return try UDC(array, codingPath)
    }
    
    public func singleValueContainer() throws -> SingleValueDecodingContainer {
        return SVDC(element, codingPath)
    }
}

extension JSONDecoderIO{
    
    static func getDouble(_ object: Any) -> Double?{
        if let double = object as? Double  {
            return Double(double)
        }
        if let float = object as? Float {
            return Double(float)
        }
        if let int = object as? Int {
            return Double(int)
        }
        
        if let string = object as? String,let double = Double(string)  {
            return double
        }
        return nil
    }
    
    
    static func getFloat(_ object: Any) -> Float?{
        if let float = object as? Float {
            return float
        }
        if let double = object as? Double  {
            return Float(double)
        }
        if let int = object as? Int {
            return Float(int)
        }
        
        if let string = object as? String,let float = Float(string)  {
            return float
        }
        return nil
    }
    
    
}

struct JSONKey:CodingKey{
    var stringValue: String
    var intValue: Int?
    
    init?(stringValue: String) {
        self.stringValue = stringValue
    }
    init(intValue: Int) {
        self.intValue = intValue
        self.stringValue = String(intValue)
    }
    
}
