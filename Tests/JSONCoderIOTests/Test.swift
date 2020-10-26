import XCTest
@testable import JSONCoderIO

final class JSONCoderIOTests: XCTestCase {
    
//
    func test(){
//        testCodable(typ: Dictionarys.Null_(null: ["value":nil]))
        testCodable(typ: Arrays.Null_(null: [nil,nil,nil,nil]))
    }
    

    func testArrayJson(){
        testCodable(typ: Arrays.Array_(array: [[],[],[],[]]))
        testCodable(typ: Arrays.Boolean_(boolean: [false,true,false,true]))
//        testCodable(typ: Arrays.PurpleDouble(double:  [ 0.0145587985,0.1699487954,0.26494441,0.369841698]))
        testCodable(typ: Arrays.Empty_(empty: []))
//        testCodable(typ: Arrays.PurpleFloat(float: [0.01648,0.15657,0.26987,0.354645]))
        testCodable(typ: Arrays.Integer_(integer: [0,1,2,3]))
        testCodable(typ: Arrays.Null_(null: [nil,nil,nil,nil]))
        testCodable(typ: Arrays.Object_(object: [Arrays.ObjectElement_(),Arrays.ObjectElement_(),Arrays.ObjectElement_(),Arrays.ObjectElement_()]))
        testCodable(typ: Arrays.String_(string:["value 0","value 1","value 2","value 3"] ))
        testCodable(typ: Arrays.Object2_(object2: [
            Arrays.Object2Element_(boolean: false, null: nil, string: "Object0", number: 0),
            Arrays.Object2Element_(boolean: true, null: nil, string: "Object1", number: 1),
            Arrays.Object2Element_(boolean: false, null: nil, string: "Object2", number: 2),
            Arrays.Object2Element_(boolean: true, null: nil, string: "Object3", number: 3)
        ]))
    }

    func testDictionarysJson(){
        testCodable(typ: Dictionarys.Array_(array: [["Number":0],["Number":1],["Number":2],["Number":3]]) )
        testCodable(typ: Dictionarys.Boolean_(boolean: ["value":true] ))
        testCodable(typ: Dictionarys.Integer_(integer: ["value":1]))
        testCodable(typ: Dictionarys.Double_(double: ["value":0.12345678]))
        testCodable(typ: Dictionarys.Empty_(empty: [:]))
        testCodable(typ: Dictionarys.Enum_(language: ["value":.english ]))
        testCodable(typ: Dictionarys.Float_(float: ["value":0.12345]))
        testCodable(typ: Dictionarys.Integer_(integer: ["value":1]))
        testCodable(typ: Dictionarys.IntegerArray_(array: ["value":[0,1,2,3]]))
        testCodable(typ: Dictionarys.Null_(null: ["value":nil]))
        testCodable(typ: Dictionarys.String_(string:["value":"string value"]))
    }

    func testBasicJson(){
        testCodable(typ: Basic.Array_(Array:[]))
        testCodable(typ: Basic.Boolean_(Boolean: false))
//        testCodable(typ: Basic.Double_(Double: 1.132154))
        testCodable(typ: Basic.Empty_())
        testCodable(typ: Basic.EnumInt_(language: .english))
        testCodable(typ: Basic.EnumString_(language: .german))
        testCodable(typ: Basic.Null_(Null: nil))
        testCodable(typ: Basic.Float_(Float: 1.1321546))
        testCodable(typ: Basic.Integer_(Integer: 23))
        testCodable(typ: Basic.Object_(Object: Basic.Empty_()))
        testCodable(typ: Basic.String_(string: ""))

    }

}

