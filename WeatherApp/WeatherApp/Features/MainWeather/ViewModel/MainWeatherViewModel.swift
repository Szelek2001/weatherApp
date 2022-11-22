import Foundation
import SwiftUI

class MainWeatherViewModel: ObservableObject {
    @Published var currentData: CurrentData?
    enum LoginFileError: Error {
        case noFileFoundError
        case encodingError
    }
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
          //  throw LoginFileError.encodingError
        }
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
    static let celsius = "°C"
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
    var value: String {
        switch self {
        case .wind:
            return "10"
        case .pressure:
            return "1020"
        case .humidity:
            return "79%"
        case .visibility:
            return "29 km"
        case .temperatureFeels:
            return "8°C"
        case .cloudiness:
            return "0%"
        case .sunrise:
            return "6:43"
        case .rain:
            return "0 mm"
        }
    }
    var description: String {
        switch self {
        case .wind:
            return Subtitles.kpH
        case .pressure:
            return Subtitles.hPA
        case .humidity:
            return Subtitles.waterVapourConcentration
        case .visibility:
            return Subtitles.greatVisibility // add if
        case .temperatureFeels:
            return Subtitles.warmerBecauseHumidity // add if
            // return Subtitles.colderB
        case .cloudiness:
            // if cloud.all = 0
            return Subtitles.cloudlessSky // add if
            // else return Subtitles.cloudinessLevel
        case .sunrise:
            return Subtitles.sunset + "16:04"
        case .rain:
            return Subtitles.last24Hours
        }
    }
}

enum WeatherType {
    case clearDay
    case clearNight
    case thunderstorm
    case drizzle
    case rain
    case snow
    case atmosphere
    case cloudsDay
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
        case .cloudsDay:
            return Icon.partyCloudyDay
        case .cloudsNight:
            return Icon.partyCloudyNight
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
        case .cloudsDay:
            return [.blue, .gray]
        case .cloudsNight:
            return [.black, .blue]
        }
    }
}
