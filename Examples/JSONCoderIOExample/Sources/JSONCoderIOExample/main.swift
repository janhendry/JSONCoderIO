import JSONCoderIO

let files = JSONFiles()


print("Decode file")
let decoder = try! JSONDecoderIO(files.file1)
let list = try! PersonList(from: decoder)
print("PersonList:")
_ = list.list.map{print($0)}



print("Encode PersonList")
let encoder = JSONEncoderIO()
try! list.encode(to: encoder)
let jsonString = try! encoder.getJson()
print("JSONFile:")
print(jsonString)
