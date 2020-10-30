import XCTest
@testable import JSONCoderIO

final class JSONCoderIOTests: XCTestCase {
        
    
    func testSets(){
        testCodable(Setts.ArrayIntOptional_.self)
        testCodable(Setts.ArrayOptional_.self)
        testCodable(Setts.Array_.self)
        testCodable(Setts.DictionaryArray_.self)
        testCodable(Setts.Dictionary_.self)
        testCodable(Setts.IntegerOptional_.self)
        testCodable(Setts.Integer_.self)
        testCodable(Setts.Optional.self)
    }

    func testOptionals(){
        testCodable(typ: Optionals.OptionalValue_(array: [], boolean: false, double: 0.12345678, language: .german, integer: 0, object: .init(), object2: .init(array: [0], boolean: false, integer: 0, null_ : nil, string: "object2") , string: "string"))
        testCodable(typ: Optionals.OptionalNull_(array: nil, array2: [nil], boolean: nil, double: nil, language: nil, integer: nil, object: nil, object2: .init(string: nil, integer: nil), string: nil ))
        testCodable(typ: Optionals.DictionaryNull_(array: ["Null":nil,"Null_0":nil,"Null_1":nil,"Null_2":nil], array2: ["Array":[nil,nil,nil,nil],"Array_0":[nil,nil,nil,nil],"Array_1":[nil,nil,nil,nil],"Array_2":[nil,nil,nil,nil]], dictionary: ["Null":nil,"Null_0":nil], integer: ["Null":nil,"Null_0":nil,"Null_1":nil,"Null_2":nil]))
        testCodable(typ: Optionals.DictionaryValue_(array: ["Array":[0,1,2,3],"Array_0":[0,1,2,3],"Array_1":[0,1,2,3],"Array_2":[0,1,2,3]], array2: ["Array":[0,1,2,3],"Array_0":[0,1,2,3],"Array_1":[0,1,2,3],"Array_2":[0,1,2,3]], dictionary:[ "Object" : [ "Number_0" : 0, "Number_1" : 1, "Number_2" : 2, "Number_3" : 3 ], "Object_1" : [ "Number" : 0, "Number_0": 1, "Number_1": 2, "Number_2": 3 ]], integer:[ "Number" : 0, "Number_0" : 1, "Number_1" : 2, "Number_2" : 3 ]))
    }

    func testArrayJson(){
        testCodable(typ: Arrays.Array_(array: [[],[],[],[]]))
        testCodable(typ: Arrays.Boolean_(boolean: [false,true,false,true]))
//        testCodable(typ: Arrays.Double_(double:  [ 0.0145587985,0.1699487954,0.26494441,0.369841698]))
        testCodable(typ: Arrays.Empty_(empty: []))
//        testCodable(typ: Arrays.Float_(float: [0.01648,0.15657,0.26987,0.354645]))
        testCodable(typ: Arrays.Integer_(integer: [0,1,2,3]))
        testCodable(typ: Arrays.Null_(null: [nil,nil,nil,nil]))
        testCodable(typ: Arrays.Object_(object: [Arrays.ObjectElement_(),Arrays.ObjectElement_(),Arrays.ObjectElement_(),Arrays.ObjectElement_()]))
        testCodable(typ: Arrays.String_(string:["value 0","value 1","value 2","value 3"] ))
        testCodable(typ: Arrays.Object2_(object2: [
            Arrays.Object2Element_(boolean: false,number: 0, null: nil, string: "Object0"),
            Arrays.Object2Element_(boolean: true,number: 1, null: nil, string: "Object1"),
            Arrays.Object2Element_(boolean: false,number: 2, null: nil, string: "Object2"),
            Arrays.Object2Element_(boolean: true,number: 3, null: nil, string: "Object3")
        ]))
    }

    func testDictionarysJson(){
        testCodable(typ: Dictionarys.Array_(array: [["Number":0],["Number":1],["Number":2],["Number":3]]) )
        testCodable(typ: Dictionarys.Boolean_(boolean: ["value":true] ))
        testCodable(typ: Dictionarys.Integer_(integer: ["value":1]))
        testCodable(typ: Dictionarys.Double_(double: ["value":0.12345678]))
        testCodable(typ: Dictionarys.Empty_(empty: [:]))
        testCodable(typ: Dictionarys.Enum_(language: ["value":.english ]))
//        testCodable(typ: Dictionarys.Float_(float: ["value":0.12345]))
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
//        testCodable(typ: Basic.Float_(Float: 1.1321546))
//        testCodable(typ: Basic.Integer_(Integer: 23, int8: 127, int16: 32767, int32: 147483647, int64: 9223372036854775807, intu: 18446744073709551615, intu8: 225, intu16: 65535, intu32: 4294967295, intu64: 18446744073709551615))
        testCodable(typ: Basic.Object_(Object: Basic.Empty_()))
        testCodable(typ: Basic.String_(string: ""))

    }

}

