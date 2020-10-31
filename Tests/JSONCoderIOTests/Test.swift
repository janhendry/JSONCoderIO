import XCTest
@testable import JSONCoderIO

final class JSONCoderIOTests: XCTestCase {
        
    
    func testNested(){
        testCodable(Nested.Foo.self)
    }
    
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
        testCodable(Optionals.OptionalValue_.self)
        testCodable(Optionals.OptionalNull_.self)
        testCodable(Optionals.DictionaryNull_.self)
        testCodable(Optionals.DictionaryValue_.self)
    }

    func testArrayJson(){
        testCodable(Arrays.Array_.self)
        testCodable(Arrays.Boolean_.self)
//        testCodable(Arrays.Double_.self)
        testCodable(Arrays.Empty_.self)
//        testCodable(Arrays.Float_(float: [0.01648,0.15657,0.26987,0.354645]))
        testCodable(Arrays.Integer_.self)
        testCodable(Arrays.Null_.self)
        testCodable(Arrays.Object_.self)
        testCodable(Arrays.String_.self)
        testCodable(Arrays.Object2_.self)
    }

    func testDictionarysJson(){
        testCodable(Dictionarys.Array_.self)
        testCodable(Dictionarys.Boolean_.self)
        testCodable(Dictionarys.Integer_.self)
        testCodable(Dictionarys.Double_.self)
        testCodable(Dictionarys.Empty_.self)
        testCodable(Dictionarys.Enum_.self)
//        testCodable(Dictionarys.Float_.self)
        testCodable(Dictionarys.Integer_.self)
        testCodable(Dictionarys.IntegerArray_.self)
        testCodable(Dictionarys.Null_.self)
        testCodable(Dictionarys.String_.self)
    }

    func testBasicJson(){
        testCodable(Basic.Array_.self)
        testCodable(Basic.Boolean_.self)
//        testCodable(Basic.Double_.self)
        testCodable(Basic.Empty_.self)
        testCodable(Basic.EnumInt_.self)
        testCodable(Basic.EnumString_.self)
        testCodable(Basic.Null_.self)
//        testCodable(typ: Basic.Float_(Float: 1.1321546))
//        testCodable(typ: Basic.Integer_(Integer: 23, int8: 127, int16: 32767, int32: 147483647, int64: 9223372036854775807, intu: 18446744073709551615, intu8: 225, intu16: 65535, intu32: 4294967295, intu64: 18446744073709551615))
        testCodable(Basic.Object_.self)
        testCodable(Basic.String_.self)

    }

}

