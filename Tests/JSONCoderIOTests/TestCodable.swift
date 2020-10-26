//
//  File.swift
//  
//
//  Created by Jan Anstipp on 26.10.20.
//
import XCTest
@testable import JSONCoderIO

extension JSONCoderIOTests {
    
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
        
    }

//    func testSingle(){
        //        let decoder1 = try! JSONDecoderIO(stringD)
        //        let t = try! T(from: decoder1)
        //        let encoder1 = JSONEncoderIO()
        //        try! t.encode(to: encoder1)
        //        let encoder1S = try! encoder1.getJson()
        //
        //
        //        XCTAssertEqual(stringShortD,encoder1S, "Codable Fail: Input != Output: \(path)")
//    }
}
