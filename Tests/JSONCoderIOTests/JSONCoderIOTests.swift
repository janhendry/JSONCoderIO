import XCTest
@testable import JSONCoderIO

final class JSONCoderIOTests: XCTestCase {
    
    func testCheckFiles() {
        let resourchPath = "JSONTestData"
        
        guard let url = Bundle.module.url(forResource: resourchPath, withExtension: nil) else{
            XCTFail("invalid resourchPath: \(resourchPath)")
            return
        }
        
        let filePaths = getJsonUrls(url, resourchPath)
        for file in filePaths {
            
            guard let data = try? Data(contentsOf: file) else{
                XCTFail( "invalide data: \(file.relativePath)")
                continue
            }
            
            guard let jsonObject = try? JSONSerialization.jsonObject(with: data)  else {
                XCTFail("invalid json data : \(file.relativePath)")
                continue
            }
            
            guard let jsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .withoutEscapingSlashes) else {
                XCTFail("invalid json data : \(file.relativePath)")
                continue
            }
            
            let datsS = String(decoding: data, as: UTF8.self)
            _ = String(decoding: jsonData, as: UTF8.self)
            
            //TODO \n " "
            //            XCTAssertEqual(datsS,dataJsonS,"FAIL: data end encode data not equals!" )
            
            guard ((try? JSONDecoderIO(datsS)) != nil) else {
                XCTFail( "Decoder Parsing Fail : \(file.relativePath)")
                continue
            }
        }
    }
    
    func testArrayJson(){
        testCodable(typ: Arrays.Array(array: [[],[],[],[]]))
        testCodable(typ: Arrays.Boolean(boolean: [false,true,false,true]))
//        testCodable(typ: Arrays.PurpleDouble(double:  [ 0.0145587985,0.1699487954,0.26494441,0.369841698]))
        testCodable(typ: Arrays.Empty(empty: []))
//        testCodable(typ: Arrays.PurpleFloat(float: [0.01648,0.15657,0.26987,0.354645]))
        testCodable(typ: Arrays.Integer(integer: [0,1,2,3]))
        testCodable(typ: Arrays.Null(null: [nil,nil,nil,nil]))
        testCodable(typ: Arrays.Object(object: [Arrays.ObjectClass(),Arrays.ObjectClass(),Arrays.ObjectClass(),Arrays.ObjectClass()]))
        testCodable(typ: Arrays.PurpleString(string:["value 0","value 1","value 2","value 3"] ))
        testCodable(typ: Arrays.Object2(object2: [
            Arrays.Object2Element(boolean: false, null: nil, string: "Object0", number: 0),
            Arrays.Object2Element(boolean: true, null: nil, string: "Object1", number: 1),
            Arrays.Object2Element(boolean: false, null: nil, string: "Object2", number: 2),
            Arrays.Object2Element(boolean: true, null: nil, string: "Object3", number: 3)
        ]))
    }
    
    func testEnum(){
//        testCodable(typ: Basic.EnumInt(language: .english))
//        testCodable(typ: Basic.EnumString(language: .german))
        testCodable(typ: Arrays.EnumInt(language: [.german,.english,.spanish,.french]))
        testCodable(typ: Arrays.EnumString(language: [.german,.english,.spanish,.french]))
    }
    
    func testBasicJson(){
        testCodable(typ: Basic.Array(Array:[]))
        testCodable(typ: Basic.Boolean(Boolean: false))
//        testCodable(typ: Basic.Double_(Double: 1.132154))
        testCodable(typ: Basic.Empty())
        testCodable(typ: Basic.EnumInt(language: .english))
        testCodable(typ: Basic.EnumString(language: .german))
        testCodable(typ: Basic.Null(Null: nil))
        testCodable(typ: Basic.Float_(Float: 1.1321546))
        testCodable(typ: Basic.Integer(Integer: 23))
        testCodable(typ: Basic.Object(Object: Basic.Empty()))
        testCodable(typ: Basic.PurpleString(string: ""))

    }
    
    func testCodable<T:Codable & BundelPath>(typ:T) {
        let path = typ.path().subDic + "/" + typ.path().file
        
        guard let url = Bundle.module.url(forResource:typ.path().file, withExtension: typ.path().ext,subdirectory: typ.path().subDic)
        else { XCTFail("invalid resource Path: \(path)"); return }
        
        guard let data = try? Data(contentsOf: url)
        else{ XCTFail("invalide data: \(path)"); return }
        
        //JSON Object from Data
        let jsonObjectD =  try! JSONSerialization.jsonObject(with: data)
        //Data without Escaping Slashes
        let shortD =  try! JSONSerialization.data(withJSONObject: jsonObjectD, options: .withoutEscapingSlashes)
        //String from data
        let stringD = String(decoding: data, as: UTF8.self)
        //String from Data without Escaping and Slashes
        let stringShortD = String(decoding: shortD, as: UTF8.self)
        
        //Decoder
        let decoder: JSONDecoderIO
        //Decode Object
        let decodeT:T
        //Encoder
        let encoder = JSONEncoderIO()
        //Data from Encoder
        //let jsonObjectFromEncoder: EncoderData.DataDic
        
        do { decoder = try JSONDecoderIO(stringD) }
        catch{ XCTFail("Decoder Parsing fail: \(path)\n\(error)\n"); return }
        
        do { decodeT = try T(from: decoder) }
        catch{ XCTFail("Decoder decoding fail: \(path)\n\(error)\n"); return }
        
        do { try decodeT.encode(to: encoder) }
        catch{ XCTFail("Encoder encoding fail: \(path)\n\(error)\n"); return }
        
        do { _ = try encoder.data.getJSON() }
        catch{ XCTFail("Encoder parsing fail: \(path)\n\(error)"); return }
        
        let stringT = try! encoder.getJson()
        
        XCTAssertEqual(stringShortD,stringT, "Codable Fail: Input != Output: \(path)")
        
        let decoder1 = try! JSONDecoderIO(stringD)
        let t = try! T(from: decoder1)
        let encoder1 = JSONEncoderIO()
        try! t.encode(to: encoder1)
        let encoder1S = try! encoder1.getJson()
        
        
        XCTAssertEqual(stringShortD,encoder1S, "Codable Fail: Input != Output: \(path)")
        
    }
    
    
    func testGetAllJson(){
        _ = getJsonUrls(Bundle.module.url(forResource: "JSONTestData", withExtension: nil)!,"JSONTestData" )
    }
    
    func getJsonUrls(_ url: URL,_ subdirectory: String ) -> [URL]{
        let fm = FileManager.default
        let allPathes = try! fm.subpathsOfDirectory(atPath: url.relativePath)
        let urls =  allPathes
            .compactMap{ URL(fileURLWithPath: $0, isDirectory: false) }
            .filter{ $0.pathExtension.elementsEqual("json") }
            .map{
                x -> URL in
                var url = x
                url.deletePathExtension()
                return url
            }
        let jsonPath = urls.compactMap{ Bundle.module.url(forResource: $0.relativePath, withExtension: "json", subdirectory: subdirectory) }
        return jsonPath
        
    }
    
}
