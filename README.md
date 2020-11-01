# JSONCoderIO

JSONCopderIO is a implementation of [JSONDecoder](https://developer.apple.com/documentation/foundation/jsondecoder) and [JSONEncoder](https://developer.apple.com/documentation/foundation/jsonencoder).  Is implemented natively in Swift and support the [Codable](https://developer.apple.com/documentation/swift/codable) Protocol. I write this Libary for the SwiftIO Board from [MadMachineIO](https://www.madmachine.io). Big thanks for this borad! 


## Instalation 

### MadMachine IDE

[Here](https://resources.madmachine.io/tutorial/how-to-use-a-libraries) you can find a good tutorial that explains how to install a library in MadMachien IDE.



## quicktype

[quicktype](https://app.quicktype.io) is a amazing tool to generate Codable Struct/Class for your JSON File. Check it out!


## Example

```
import JSONCoderIO

var json = """
    {
      "Name" : "Kevin",
      "Age" : 16,
      "Nickname" : "Kivi",
      "Single" : true
    }
    """

// We need the right Codable Structs  https://app.quicktype.io

struct Person: Codable {
    let name: String
    let age: Int
    let nickname: String
    let single: Bool

    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case age = "Age"
        case nickname = "Nickname"
        case single = "Single"
    }
}

// Decode String

let decoder = try! JSONDecoderIO(json)
let person = try! Person(from: decoder)
print(person)

//Encode the Struct 

let encoder = JSONEncoderIO()
try! person.encode(to: encoder)
let jsonString = try? encoder.getJson()
print(jsonString)

```



## Overview

An overview of what has been tested with this library. If you have found errors or formats that I need to test. Let me know.

| Libary                                                       | Type                                                         | Decodable | Encodable |
| ------------------------------------------------------------ | :----------------------------------------------------------- | --------- | :-------- |
| [`Swift Standard Library`](https://developer.apple.com/documentation/swift/swift_standard_library) | [`Array`](https://developer.apple.com/documentation/swift/array) | true      | true      |
| [`Swift Standard Library`](https://developer.apple.com/documentation/swift/swift_standard_library) | [`Bool`](https://developer.apple.com/documentation/swift/bool) | true      | true      |
| [`Swift Standard Library`](https://developer.apple.com/documentation/swift/swift_standard_library) | [`Dictionary`](https://developer.apple.com/documentation/swift/dictionary) | true         | true         |
| [`Swift Standard Library`](https://developer.apple.com/documentation/swift/swift_standard_library) | [`Double`](https://developer.apple.com/documentation/swift/double) | true      | true      |
| [`Swift Standard Library`](https://developer.apple.com/documentation/swift/swift_standard_library) | [`Float`](https://developer.apple.com/documentation/swift/float) | true      | true      |
| [`Swift Standard Library`](https://developer.apple.com/documentation/swift/swift_standard_library) | [`Int`](https://developer.apple.com/documentation/swift/int) | true      | true      |
| [`Swift Standard Library`](https://developer.apple.com/documentation/swift/swift_standard_library) | [`Int8`](https://developer.apple.com/documentation/swift/int8) | true      | true      |
| [`Swift Standard Library`](https://developer.apple.com/documentation/swift/swift_standard_library) | [`Int16`](https://developer.apple.com/documentation/swift/int16) | true      | true      |
| [`Swift Standard Library`](https://developer.apple.com/documentation/swift/swift_standard_library) | [`Int32`](https://developer.apple.com/documentation/swift/int32) | true      | true      |
| [`Swift Standard Library`](https://developer.apple.com/documentation/swift/swift_standard_library) | [`Int64`](https://developer.apple.com/documentation/swift/int64) | true      | true      |
| [`Swift Standard Library`](https://developer.apple.com/documentation/swift/swift_standard_library) | [`Optional`](https://developer.apple.com/documentation/swift/optional) | true         | true         |
| [`Swift Standard Library`](https://developer.apple.com/documentation/swift/swift_standard_library) | [`Set`](https://developer.apple.com/documentation/swift/set) | true         | true         |
| [`Swift Standard Library`](https://developer.apple.com/documentation/swift/swift_standard_library) | [`String`](https://developer.apple.com/documentation/swift/string) | true      | true      |





Test Missing:
| Libary                                                       | Type                                                         |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| [`Swift Standard Library`](https://developer.apple.com/documentation/swift/swift_standard_library) | [`ClosedRange`](https://developer.apple.com/documentation/swift/closedrange) |
| [`Swift Standard Library`](https://developer.apple.com/documentation/swift/swift_standard_library) | [`CollectionDifference`](https://developer.apple.com/documentation/swift/collectiondifference) |
| [`Swift Standard Library`](https://developer.apple.com/documentation/swift/swift_standard_library) | [`CollectionDifference.Change`](https://developer.apple.com/documentation/swift/collectiondifference/change) |
| [`Swift Standard Library`](https://developer.apple.com/documentation/swift/swift_standard_library) | [`ContiguousArray`](https://developer.apple.com/documentation/swift/contiguousarray) |
| [`Swift Standard Library`](https://developer.apple.com/documentation/swift/swift_standard_library) | [`Float16`](https://developer.apple.com/documentation/swift/float16) |
| [`Swift Standard Library`](https://developer.apple.com/documentation/swift/swift_standard_library) | [`PartialRangeThrough`](https://developer.apple.com/documentation/swift/partialrangethrough) |
| [`Swift Standard Library`](https://developer.apple.com/documentation/swift/swift_standard_library) | [`PartialRangeUpTo`](https://developer.apple.com/documentation/swift/partialrangeupto) |
| [`Swift Standard Library`](https://developer.apple.com/documentation/swift/swift_standard_library) | [`Range`](https://developer.apple.com/documentation/swift/range) |

