struct Person: Codable {
    let name: String
    let age: Int
	let nickname: String?
    let single: Bool

    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case age = "Age"
        case nickname = "Nickname"
        case single = "Single"
    }
}

struct PersonList: Codable {
    let list: [Person]

    enum CodingKeys: String, CodingKey {
        case list = "PersonList"
    }
}

struct JSONFiles{
    var file1:String = """
    {
      "PersonList" : [
        {
          "Name" : "Kevin",
          "Age" : 16,
          "Nickname" : "Kivi",
          "Single" : true
        },
    	{
          "Name" : "Justin",
          "Age" : 23,
          "Nickname" : "Just",
          "Single" : false
        },
    	{
          "Name" : "Julia",
          "Age" : 3,
          "Nickname" : null,
          "Single" : false
        }
      ]
    }
    """    
}
