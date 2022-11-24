import Foundation
import SwiftUI

class MainWeatherViewModel: ObservableObject {
    enum LoginFileError: Error {
        case noFileFoundError
        case encodingError
    }
    @Published var currentData: CurrentData? {
        didSet {
            currentWeatherType = setupWeatherType(icon: currentData?.weather.first!.icon)
            visibility = (currentData?.visibility ?? 0)/1000
            pressure = currentData?.main.pressure ?? 0
            windSpeed = Int(currentData?.wind.speed ?? 0)
            humidity = currentData?.main.humidity ?? 0
            temperatureFeels = Int(currentData?.main.feelLike ?? 0)
            claudiness = currentData?.clouds.all ?? 0
            sunrise = convertUNIXToHour(unix: currentData?.sys.sunrise ?? 0)
            rain = Int(currentData?.rain?.oneHour ?? 0)
        }
    }
    @Published var currentWeatherType: WeatherType!
    private var visibility: Int!
    private var pressure: Int!
    private var windSpeed: Int!
    private var humidity: Int!
    private var temperatureFeels: Int!
    private var claudiness: Int!
    private var sunrise: String!
    private var rain: Int!
    func loadJson() async {
        if let url = Bundle.main.url(
            forResource: "currentWeatherData", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(CurrentData.self, from: data)
                currentData = jsonData
            } catch let jsonError as NSError {
                print("JSON decode failed: \(jsonError)")
            }
        } else {
            print("E")
            // throw LoginFileError.encodingError
        }
    }
    func setupWeatherType(icon: String?) -> WeatherType {
        switch icon {
        case "01d":
            return .clearDay
        case "01n":
            return .clearNight
        case "02d":
            return .partyCloudsDay
        case "02n":
            return .cloudsNight
        case "03n", "03d", "04d", "04n":
            return .clauds
        case "09n", "09d":
            return .drizzle
        case "10n", "10d":
            return .rain
        case "11n", "11d":
            return .thunderstorm
        case "13n", "13d":
            return .snow
        case "50n", "50d":
            return .atmosphere
        case .none:
            return .clearDay
        case .some:
            return .clearDay
        }
    }
    func makeFactorValue(factor: Factor) -> String {
        switch factor {
        case .wind:
            return String(windSpeed)
        case .pressure:
            return String(pressure)
        case .humidity:
            return String(humidity) + Units.percent
        case .visibility:
            return String(visibility) + Units.kilometers
        case .temperatureFeels:
            return String(temperatureFeels) + Units.celsius
        case .cloudiness:
            return String(claudiness) + Units.percent
        case .sunrise:
            return sunrise
        case .rain:
            return String(rain) + Units.milimiters
        }
    } // Tobiasz jak to zrobić inaczej?
    func makeFactorDescription(factor: Factor) -> String {
        switch factor {
        case .wind:
            return Subtitles.kpH
        case .pressure:
            return Subtitles.hPA
        case .humidity:
            return Subtitles.waterVapourConcentration
        case .visibility:
            if visibility < 10 {
                return Subtitles.badVisibility }
            if visibility > 30 {
                return Subtitles.greatVisibility
            }
            return Subtitles.averageVisibility
        case .temperatureFeels:
            return Subtitles.warmerBecauseHumidity // add if
            // return Subtitles.colderB
        case .cloudiness:
            // if cloud.all = 0
            return Subtitles.cloudlessSky
        case .sunrise:
            return Subtitles.sunset + String(convertUNIXToHour(unix: currentData?.sys.sunset ?? 0))
        case .rain:
            return Subtitles.last24Hours
        }
    }
    func convertUNIXToHour(unix: Int) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: Date(timeIntervalSince1970: Double(unix)))
    }
}
enum Subtitles { // Zapytać czy nazwa ok?
    static let hourlyForecast = "Godzinowa prognoza"
    static let weeklyForecast = "10 dniowa prognowa"
    static let wind = "wiatr"
    static let pressure = "ciśnienie"
    static let humidity = "wilgotność"
    static let visibility = "widoczność"
    static let temperatureFeels = "odczuwalna"
    static let cloudiness = "zachmurzenie"
    static let sunrise = "wschód"
    static let rain = "opady"
    static let kpH = "km/godz."
    static let hPA = "hPA"
    static let waterVapourConcentration = "Pary wodnej w powietrzu"
    static let cloudlessSky = "Bezchmurne niebo"
    static let cloudinessLevel = "Niebo zachmurzone w"
    static let greatVisibility = "Widoczność jest idealna"
    static let averageVisibility = "Widoczność jest przeciętna"
    static let badVisibility = "Widocznośc jest słaba"
    static let colderBecauseWind = "Przez wiatr wydaje się zimniej"
    static let fellHowItIs = "Temperatura odczuwalna zgadza si z rzecywistą"
    static let warmerBecauseHumidity = "Przez wilgotność wydaje się cieplej"
    static let sunset = "Zachód: "
    static let last24Hours = "w ciągu ostatnich 24 h"
    static let from = "od "
    static let until = " do "
}

enum Units {
    static let celsius = "°C"
    static let milimiters = "mm"
    static let kilometers = "km"
    static let percent = "%"
}

enum Factor {
    case wind
    case pressure
    case humidity
    case visibility
    case temperatureFeels
    case cloudiness
    case sunrise
    case rain
    var image: Image {
        switch self {
        case .wind:
            return Symbols.wind
        case .pressure:
            return Symbols.sunrise
        case .humidity:
            return Symbols.humidity
        case .visibility:
            return Symbols.visibility
        case .temperatureFeels:
            return Symbols.thermometer
        case .cloudiness:
            return Symbols.cloudiness
        case .sunrise:
            return Symbols.sunrise
        case .rain:
            return Symbols.rain
        }
    }
    var name: String {
        switch self {
        case .wind:
            return Subtitles.wind
        case .pressure:
            return Subtitles.pressure
        case .humidity:
            return Subtitles.humidity
        case .visibility:
            return Subtitles.visibility
        case .temperatureFeels:
            return Subtitles.temperatureFeels
        case .cloudiness:
            return Subtitles.cloudiness
        case .sunrise:
            return Subtitles.sunrise
        case .rain:
            return Subtitles.rain
        }
    }
//    var value: String {
//        switch self {
//        case .wind:
//            return "10"
//        case .pressure:
//            return "1020"
//        case .humidity:
//            return "79%"
//        case .visibility:
//            return "29 km"
//        case .temperatureFeels:
//            return "8°C"
//        case .cloudiness:
//            return "0%"
//        case .sunrise:
//            return "6:43"
//        case .rain:
//            return "0 mm"
//        }
//    }
//    var description: String {
//        switch self {
//        case .wind:
//            return Subtitles.kpH
//        case .pressure:
//            return Subtitles.hPA
//        case .humidity:
//            return Subtitles.waterVapourConcentration
//        case .visibility:
//            return Subtitles.greatVisibility // add if
//        case .temperatureFeels:
//            return Subtitles.warmerBecauseHumidity // add if
//            // return Subtitles.colderB
//        case .cloudiness:
//            // if cloud.all = 0
//            return Subtitles.cloudlessSky // add if
//            // else return Subtitles.cloudinessLevel
//        case .sunrise:
//            return Subtitles.sunset + "16:04"
//        case .rain:
//            return Subtitles.last24Hours
//        }
//    }
}

enum WeatherType {
    case clearDay
    case clearNight
    case thunderstorm
    case drizzle
    case rain
    case snow
    case atmosphere
    case clauds
    case partyCloudsDay
    case cloudsNight
    var icon: Image {
        switch self {
        case .clearDay:
            return Icon.sun
        case .clearNight:
            return Icon.moon
        case .thunderstorm:
            return Icon.rainAndThounder
        case .drizzle:
            return Icon.drizzle
        case .rain:
            return Icon.rain
        case .snow:
            return Icon.snow
        case .atmosphere:
            return Icon.fog
        case .partyCloudsDay:
            return Icon.partyCloudyDay
        case .cloudsNight:
            return Icon.partyCloudyNight
        case .clauds:
            return Icon.cloudy
        }
    }
    var backgroundColor: [Color] {
        switch self {
        case .clearDay:
            return [.blue, .white]
        case .clearNight:
            return [.black, .white]
        case .thunderstorm:
            return [.black, .gray]
        case .drizzle:
            return [.black, .cyan]
        case .rain:
            return [.black, .blue]
        case .snow:
            return [.blue, .white]
        case .atmosphere:
            return [.gray, .white]
        case .partyCloudsDay, .clauds:
            return [.blue, .gray]
        case .cloudsNight:
            return [.black, .blue]
        }
    }
}
