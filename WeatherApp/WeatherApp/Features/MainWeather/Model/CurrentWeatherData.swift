import Foundation

struct CurrentData: Codable {
    var coord: Coord
    var weather: [Weather]
    var base: String
    var main: Main
    var visibility: Int
    var wind: Wind
    var rain: Rain?
    var clouds: Clouds
    var dt: Int
    var sys: Sys
    var timezone: Int
    var id: Int
    var name: String
    var cod: Int
}

struct Coord: Codable {
    var lon: Float
    var lat: Float
}

struct Weather: Codable {
    var id: Int
    var main: String
    var description: String
    var icon: String
}

struct Main: Codable {
    var temp: Float
    var feelLike: Float
    var tempMin: Float
    var tempMax: Float
    var pressure: Int
    var humidity: Int
    var seaLevel: Int?
    var grndLevel: Int?
    private enum CodingKeys: String, CodingKey {
        case temp = "temp"
        case feelLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure = "pressure"
        case humidity = "humidity"
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
    }
}

struct Wind: Codable {
    var speed: Float
    var deg: Int
    var gust: Float
}

struct Rain: Codable {
    var oneHour: Float
    private enum CodingKeys: String, CodingKey {
        case oneHour = "1h"
    }
}

struct Clouds: Codable {
    var all: Int
}

struct Sys: Codable {
    var type: Int
    var id: Int
    var country: String
    var sunrise: Int
    var sunset: Int
}
