//
//  File.swift
//  
//
//  Created by Jan Anstipp on 31.10.20.
//

enum Nested{
    
    struct Foo: Codable, BundelPath {
        
        let bar: Bool
        let baz: String
        let bestFriend: String
        let funnyGuy: String
        let favoriteWeirdo: String
        
        enum CodingKeys: String, CodingKey {
            case response = "Response"
            case bar = "Bar"
            case baz = "Baz"
            case friends = "Friends"
            case bestFriend = "Best"
            case funnyGuy = "FunnyGuy"
            case favoriteWeirdo = "FavoriteWeirdo"
        }
        // Decoding
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            let response = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .response)
            bar = try response.decode(Bool.self, forKey: .bar)
            baz = try response.decode(String.self, forKey: .baz)
            let friends = try response.nestedContainer(keyedBy: CodingKeys.self, forKey: .friends)
            bestFriend = try friends.decode(String.self, forKey: .bestFriend)
            funnyGuy = try friends.decode(String.self, forKey: .funnyGuy)
            favoriteWeirdo = try friends.decode(String.self, forKey: .favoriteWeirdo)
        }
        // Encoding
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            var response = container.nestedContainer(keyedBy: CodingKeys.self, forKey: .response)
            try response.encode(bar, forKey: .bar)
            try response.encode(baz, forKey: .baz)
            var friends = response.nestedContainer(keyedBy: CodingKeys.self, forKey: .friends)
            try friends.encode(bestFriend, forKey: .bestFriend)
            try friends.encode(funnyGuy, forKey: .funnyGuy)
            try friends.encode(favoriteWeirdo, forKey: .favoriteWeirdo)
        }
        
        static func path() -> (subDic:String,file:String,ext:String) {
            return ("JSONTestData/Nested","Nested","json")
        }
    }
}
