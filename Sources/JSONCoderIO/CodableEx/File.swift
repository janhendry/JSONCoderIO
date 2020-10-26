//
//  File.swift
//  
//
//  Created by Jan Anstipp on 26.10.20.
//


extension Dictionary: Decodable where Key: Codable, Value: Decodable {
  /// Creates a new dictionary by decoding from the given decoder.
  ///
  /// This initializer throws an error if reading from the decoder fails, or
  /// if the data read is corrupted or otherwise invalid.
  ///
  /// - Parameter decoder: The decoder to read data from.
  public init(from decoder: Decoder) throws {
    self.init()
    fatalError()
//    if Key.self == String.self {
//      // The keys are Strings, so we should be able to expect a keyed container.
//      let container = try decoder.container(keyedBy: _DictionaryCodingKey.self)
//      for key in container.allKeys {
//        let value = try container.decode(Value.self, forKey: key)
//        self[key.stringValue as! Key] = value
//      }
//    } else if Key.self == Int.self {
//      // The keys are Ints, so we should be able to expect a keyed container.
//      let container = try decoder.container(keyedBy: _DictionaryCodingKey.self)
//      for key in container.allKeys {
//        guard key.intValue != nil else {
//          // We provide stringValues for Int keys; if an encoder chooses not to
//          // use the actual intValues, we've encoded string keys.
//          // So on init, _DictionaryCodingKey tries to parse string keys as
//          // Ints. If that succeeds, then we would have had an intValue here.
//          // We don't, so this isn't a valid Int key.
//          var codingPath = decoder.codingPath
//          codingPath.append(key)
//          throw DecodingError.typeMismatch(
//            Int.self,
//            DecodingError.Context(
//              codingPath: codingPath,
//              debugDescription: "Expected Int key but found String key instead."
//            )
//          )
//        }
//
//        let value = try container.decode(Value.self, forKey: key)
//        self[key.intValue! as! Key] = value
//      }
//    } else {
//      // We should have encoded as an array of alternating key-value pairs.
//      var container = try decoder.unkeyedContainer()
//
//      // We're expecting to get pairs. If the container has a known count, it
//      // had better be even; no point in doing work if not.
//      if let count = container.count {
//        guard count % 2 == 0 else {
//          throw DecodingError.dataCorrupted(
//            DecodingError.Context(
//              codingPath: decoder.codingPath,
//              debugDescription: "Expected collection of key-value pairs; encountered odd-length array instead."
//            )
//          )
//        }
//      }
//
//      while !container.isAtEnd {
//        let key = try container.decode(Key.self)
//
//        guard !container.isAtEnd else {
//          throw DecodingError.dataCorrupted(
//            DecodingError.Context(
//              codingPath: decoder.codingPath,
//              debugDescription: "Unkeyed container reached end before value in key-value pair."
//            )
//          )
//        }
//
//        let value = try container.decode(Value.self)
//        self[key] = value
//      }
//    }
  }
}

extension KeyedDecodingContainer {
    func decode(_ type: Dictionary<String, Any>.Type, forKey key: K) throws -> Dictionary<String, Any> {
//        let container = try self.nestedContainer(keyedBy: JSONCodingKeys.self, forKey: key)
//        return try container.decode(type)
        fatalError()
    }
    func decodeIfPresent(_ type: Dictionary<String, Any>.Type, forKey key: K) throws -> Dictionary<String, Any>? {
        guard contains(key) else {
            return nil
        }
        return try decode(type, forKey: key)
    }
    func decode(_ type: Array<Any>.Type, forKey key: K) throws -> Array<Any> {
//        var container = try self.nestedUnkeyedContainer(forKey: key)
//        return try container.decode(type)
        fatalError()
    }
    func decodeIfPresent(_ type: Array<Any>.Type, forKey key: K) throws -> Array<Any>? {
        fatalError()
//        guard contains(key) else {
//            return nil
//        }
//        return try decode(type, forKey: key)
    }
    func decode(_ type: Dictionary<String, Any>.Type) throws -> Dictionary<String, Any> {
//        var dictionary = Dictionary<String, Any>()
//        for key in allKeys {
//            if let if let boolValue = try? decode(Bool.self, forKey: key) {
//                dictionary[key.stringValue] = boolValue
//            } else if let stringValue = try? decode(String.self, forKey: key) {
//                dictionary[key.stringValue] = stringValue
//            } else intValue = try? decode(Int.self, forKey: key) {
//                dictionary[key.stringValue] = intValue
//            } else if let doubleValue = try? decode(Double.self, forKey: key) {
//                dictionary[key.stringValue] = doubleValue
//            } else if let fileMetaData = try? decode(Asset.FileMetadata.self, forKey: key) {
//                dictionary[key.stringValue] = fileMetaData // Custom contentful type.
//            } else if let nestedDictionary = try? decode(Dictionary<String, Any>.self, forKey: key) {
//                dictionary[key.stringValue] = nestedDictionary
//            } else if let nestedArray = try? decode(Array<Any>.self, forKey: key) {
//                dictionary[key.stringValue] = nestedArray
//            }
//        }
//        return dictionary
        fatalError()
    }
}
