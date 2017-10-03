import Foundation

struct Movie: Codable {
    enum MovieGenere: String, Codable {
        case horror, skifi, comedy, adventure, animation
    }
    
    var name : String
    var moviesGenere : [MovieGenere]
    var rating : Int
	
	enum CodingKeys: String, CodingKey {
        case name = "title"
        case moviesGenere = "movies_genere"
        case rating
    }
}

let aMovie = Movie(name: "Up", moviesGenere: [.comedy , .adventure, .animation], rating : 4)

// Encode data

let jsonEncoder = JSONEncoder()
do {
    let jsonData = try jsonEncoder.encode(aMovie)
	let jsonString = String(data: jsonData, encoding: .utf8)
    print("JSON String : " + jsonString!)
	print("JSON Data : \(jsonData.count) bytes")
    
    // Decode data to object
    let jsonDecoder = JSONDecoder()
    let bMovie = try jsonDecoder.decode(Movie.self, from: jsonData)
    print(bMovie)
    print("Name : " + bMovie.name)
    print("Rating : \(bMovie.rating)")
    print(bMovie.moviesGenere)
}
catch {
    print("Some Errors")
}
