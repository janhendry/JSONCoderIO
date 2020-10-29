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
        
        guard let fileData = try? Data(contentsOf: url)
        else{ XCTFail("invalide data: \(path)"); return }
        
        let serialStringFromeFileData = String(decoding: fileData, as: UTF8.self)
        
        let encoder = JSONEncoder()
        encoder.outputFormatting = .sortedKeys
        
        let decoderIO: JSONDecoderIO
        let encoderIO = JSONEncoderIO()
        
        let decodeObject: T, decodeObjectIO:T
        let encodeData: Data
        let encodeString: String, encodeStringIO: String

        do { decodeObject = try JSONDecoder().decode(T.self, from: fileData) }
        catch{ XCTFail("Decoder decode fail: \(path)\n\(error)\n"); return }
        
        do { decoderIO = try JSONDecoderIO(serialStringFromeFileData) }
        catch{ XCTFail("DecoderIO Parsing fail: \(path)\n\(error)\n"); return }
        
        do { decodeObjectIO = try T(from: decoderIO) }
        catch{ XCTFail("DecoderIO decoding fail: \(path)\n\(error)\n"); return }
        
        XCTAssertEqual(decodeObject, decodeObjectIO, "JSONDecoder != JSONDecoderIO")
        
        do { encodeData = try encoder.encode(decodeObjectIO) }
        catch{ XCTFail("Encoder encoding fail: \(path)\n\(error)\n"); return }
        
        encodeString = String(decoding: encodeData, as: UTF8.self)
        
        do { try decodeObjectIO.encode(to: encoderIO) }
        catch{ XCTFail("EncoderIO encoding fail: \(path)\n\(error)\n"); return }
        
        do { _ = try encoderIO.data.getJSON() }
        catch{ XCTFail("EncoderIO parsing fail: \(path)\n\(error)"); return }
        
        encodeStringIO = try! encoderIO.getJson()
        XCTAssertEqual(encodeString,encodeStringIO, "Encoder != EncoderIO : \(path)")
        
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
