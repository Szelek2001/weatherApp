import Foundation

struct ThreeHoursData: Codable {
    var cod: String
    var message: Int
    var cnt: Int
    var list: [List]
    var city: City
}

struct List: Codable {
    var dataTime: Int
    var main: Main
    var weather: [Weather]
    var clouds: Clouds
    var wind: Wind
    var visibility: Int
    var pop: Float
    var rain: Rain?
    var sys: Syss
    var dtTxt: String
    private enum CodingKeys: String, CodingKey {
        case dataTime = "dt"
        case main = "main"
        case weather = "weather"
        case clouds = "clouds"
        case wind = "wind"
        case visibility = "visibility"
        case pop = "pop"
        case rain = "rain"
        case sys = "sys"
        case dtTxt = "dt_txt"
    }
}
extension List: Hashable {
    static func == (lhs: List, rhs: List) -> Bool {
        lhs.dtTxt == rhs.dtTxt
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(dtTxt)
    }
}

struct City: Codable {
    var id: Int
    var name: String
    var coord: Coord
    var country: String
    var population: Int
    var timezone: Int
    var sunrise: Int
    var sunset: Int
}

struct Syss: Codable {
    var pod: String
}
