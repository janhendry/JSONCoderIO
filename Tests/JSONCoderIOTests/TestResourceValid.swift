//
//  File 2.swift
//  
//
//  Created by Jan Anstipp on 26.10.20.
//

import XCTest
@testable import JSONCoderIO

extension JSONCoderIOTests{
    
    //    func testCheckFiles() {
    //        let resourchPath = "JSONTestData"
    //
    //        guard let url = Bundle.module.url(forResource: resourchPath, withExtension: nil) else{
    //            XCTFail("invalid resourchPath: \(resourchPath)")
    //            return
    //        }
    //
    //        let filePaths = getJsonUrls(url, resourchPath)
    //        for file in filePaths {
    //
    //            guard let data = try? Data(contentsOf: file) else{
    //                XCTFail( "invalide data: \(file.relativePath)")
    //                continue
    //            }
    //
    //            guard let jsonObject = try? JSONSerialization.jsonObject(with: data)  else {
    //                XCTFail("invalid json data : \(file.relativePath)")
    //                continue
    //            }
    //
    //            guard let jsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .withoutEscapingSlashes) else {
    //                XCTFail("invalid json data : \(file.relativePath)")
    //                continue
    //            }
    //
    //            let datsS = String(decoding: data, as: UTF8.self)
    //            _ = String(decoding: jsonData, as: UTF8.self)
    //
    //            //TODO \n " "
    //            //            XCTAssertEqual(datsS,dataJsonS,"FAIL: data end encode data not equals!" )
    //
    //            guard ((try? JSONDecoderIO(datsS)) != nil) else {
    //                XCTFail( "Decoder Parsing Fail : \(file.relativePath)")
    //                continue
    //            }
    //        }
    //    }
    
    
//    func testGetAllJson(){
//        _ = getJsonUrls(Bundle.module.url(forResource: "JSONTestData", withExtension: nil)!,"JSONTestData" )
//    }
//
//    func getJsonUrls(_ url: URL,_ subdirectory: String ) -> [URL]{
//        let fm = FileManager.default
//        let allPathes = try! fm.subpathsOfDirectory(atPath: url.relativePath)
//        let urls =  allPathes
//            .compactMap{ URL(fileURLWithPath: $0, isDirectory: false) }
//            .filter{ $0.pathExtension.elementsEqual("json") }
//            .map{
//                x -> URL in
//                var url = x
//                url.deletePathExtension()
//                return url
//            }
//        let jsonPath = urls.compactMap{ Bundle.module.url(forResource: $0.relativePath, withExtension: "json", subdirectory: subdirectory) }
//        return jsonPath
//
//    }
    
    //    func testDict(){
    //        let typ = Dictionarys.Boolean_(boolean: ["Boolean":false] )
    //        let path = typ.path().subDic + "/" + typ.path().file
    //        guard let url = Bundle.module.url(forResource:typ.path().file, withExtension: typ.path().ext,subdirectory: typ.path().subDic)
    //        else { XCTFail("invalid resource Path: \(path)"); return }
    //
    //        guard let data = try? Data(contentsOf: url)
    //        else{ XCTFail("invalide data: \(path)"); return }
    //
    //        //JSON Object from Data
    //        let jsonObjectD =  try! JSONSerialization.jsonObject(with: data)
    //        //Data without Escaping Slashes
    //        let shortD =  try! JSONSerialization.data(withJSONObject: jsonObjectD, options: .withoutEscapingSlashes)
    //        //String from data
    //        let stringD = String(decoding: data, as: UTF8.self)
    //        //String from Data without Escaping and Slashes
    //        let stringShortD = String(decoding: shortD, as: UTF8.self)
    //        let structfromJSONDecoder = try! JSONDecoder().decode( Dictionarys.Boolean_.self , from: data)
    //        print(structfromJSONDecoder)
    //    }
}
