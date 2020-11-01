//
//  File 2.swift
//  
//
//  Created by Jan Anstipp on 26.10.20.
//

import XCTest
@testable import JSONCoderIO

extension JSONCoderIOTests{
    
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
            
            guard ((try? JSONDecoderIO(datsS)) != nil) else {
                XCTFail( "Decoder Parsing Fail : \(file.relativePath)")
                continue
            }
        }
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
