# JSONCoderIO

JSONCopderIO is a implementation of [JSONDecoder](https://developer.apple.com/documentation/foundation/jsondecoder) and [JSONEncoder](https://developer.apple.com/documentation/foundation/jsonencoder).  Is implemented natively in Swift and support the [Codable](https://developer.apple.com/documentation/swift/codable) Protocol. I write this Libary for the SwiftIO Board from [MadMachineIO](https://www.madmachine.io). Big thanks for this borad! 

Currently, i start with the project, so give time to test all stuff.

## Overview

An overview of what has been tested with this library. If you have found errors or formats that I have not tested. Let me know.

| Libary                                                       | Type                                                         | Decodable | Encodable |
| ------------------------------------------------------------ | :----------------------------------------------------------- | --------- | :-------- |
| [`Swift Standard Library`](https://developer.apple.com/documentation/swift/swift_standard_library) | [`Array`](doc://com.apple.documentation/documentation/swift/array) | true      | true      |
| [`Swift Standard Library`](https://developer.apple.com/documentation/swift/swift_standard_library) | [`Bool`](doc://com.apple.documentation/documentation/swift/bool) | true      | true      |
| [`Swift Standard Library`](https://developer.apple.com/documentation/swift/swift_standard_library) | [`ClosedRange`](doc://com.apple.documentation/documentation/swift/closedrange) | ?         | ?         |
| [`Swift Standard Library`](https://developer.apple.com/documentation/swift/swift_standard_library) | [`CollectionDifference`](doc://com.apple.documentation/documentation/swift/collectiondifference) | ?         | ?         |
| [`Swift Standard Library`](https://developer.apple.com/documentation/swift/swift_standard_library) | [`CollectionDifference.Change`](doc://com.apple.documentation/documentation/swift/collectiondifference/change) | ?         | ?         |
| [`Swift Standard Library`](https://developer.apple.com/documentation/swift/swift_standard_library) | [`ContiguousArray`](doc://com.apple.documentation/documentation/swift/contiguousarray) | ?         | ?         |
| [`Swift Standard Library`](https://developer.apple.com/documentation/swift/swift_standard_library) | [`Dictionary`](doc://com.apple.documentation/documentation/swift/dictionary) | true         | true         |
| [`Swift Standard Library`](https://developer.apple.com/documentation/swift/swift_standard_library) | [`Double`](doc://com.apple.documentation/documentation/swift/double) | true      | true      |
| [`Swift Standard Library`](https://developer.apple.com/documentation/swift/swift_standard_library) | [`Float`](doc://com.apple.documentation/documentation/swift/float) | true      | true      |
| [`Swift Standard Library`](https://developer.apple.com/documentation/swift/swift_standard_library) | [`Float16`](doc://com.apple.documentation/documentation/swift/float16) | ?         | ?         |
| [`Swift Standard Library`](https://developer.apple.com/documentation/swift/swift_standard_library) | [`Int`](doc://com.apple.documentation/documentation/swift/int) | true      | true      |
| [`Swift Standard Library`](https://developer.apple.com/documentation/swift/swift_standard_library) | [`Int8`](doc://com.apple.documentation/documentation/swift/int8) | true      | true      |
| [`Swift Standard Library`](https://developer.apple.com/documentation/swift/swift_standard_library) | [`Int16`](doc://com.apple.documentation/documentation/swift/int16) | true      | true      |
| [`Swift Standard Library`](https://developer.apple.com/documentation/swift/swift_standard_library) | [`Int32`](doc://com.apple.documentation/documentation/swift/int32) | true      | true      |
| [`Swift Standard Library`](https://developer.apple.com/documentation/swift/swift_standard_library) | [`Int64`](doc://com.apple.documentation/documentation/swift/int64) | true      | true      |
| [`Swift Standard Library`](https://developer.apple.com/documentation/swift/swift_standard_library) | [`Optional`](doc://com.apple.documentation/documentation/swift/optional) | true         | true         |
| [`Swift Standard Library`](https://developer.apple.com/documentation/swift/swift_standard_library) | [`PartialRangeThrough`](doc://com.apple.documentation/documentation/swift/partialrangethrough) | ?         | ?         |
| [`Swift Standard Library`](https://developer.apple.com/documentation/swift/swift_standard_library) | [`PartialRangeUpTo`](doc://com.apple.documentation/documentation/swift/partialrangeupto) | ?         | ?         |
| [`Swift Standard Library`](https://developer.apple.com/documentation/swift/swift_standard_library) | [`Range`](doc://com.apple.documentation/documentation/swift/range) | ?         | ?         |
| [`Swift Standard Library`](https://developer.apple.com/documentation/swift/swift_standard_library) | [`Set`](doc://com.apple.documentation/documentation/swift/set) | ?         | ?         |
| [`Swift Standard Library`](https://developer.apple.com/documentation/swift/swift_standard_library) | [`String`](doc://com.apple.documentation/documentation/swift/string) | true      | true      |
