import Foundation
import SwiftUI

enum Factor {
    case wind
    case pressure
    case humidity
    case visibility
    case temperatureFeels
    case cloudiness
    case sunset
    case rain
    
    var image: Image {
        switch self {
        case .wind:
            return Symbols.wind
        case .pressure:
            return Symbols.sunset
        case .humidity:
            return Symbols.humidity
        case .visibility:
            return Symbols.visibility
        case .temperatureFeels:
            return Symbols.thermometer
        case .cloudiness:
            return Symbols.cloudiness
        case .sunset:
            return Symbols.sunset
        case .rain:
            return Symbols.rain
        }
    }
    var name: String {
        switch self {
        case .wind:
            return "wiatr"
        case .pressure:
            return "ciśnienie"
        case .humidity:
            return "wilgotność"
        case .visibility:
            return "widoczność"
        case .temperatureFeels:
            return "odczuwalna"
        case .cloudiness:
            return "zachmurzenie"
        case .sunset:
            return "wschód"
        case .rain:
            return "opady"
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
        case .sunset:
            return "6:43"
        case .rain:
            return "0 mm"
        }
    }
    var description: String {
        switch self {
        case .wind:
            return "km/godz"
        case .pressure:
            return "hPA"
        case .humidity:
            return "pary wodnej w powietrzu"
        case .visibility:
            return "Idealna widoczność" // add if
        case .temperatureFeels:
            return "Przez wiatr wydaje się zimniej" // add if
        case .cloudiness:
            return "Niebo czyste" // add if
        case .sunset:
            return "Zachód: 16:04"
        case .rain:
            return "w ciągu ostatnich 24h"
        }
    }
    var unit: Bool {
        switch self {
        case .wind:
            return true
        case .pressure:
            return true
        case .humidity:
            return false
        case .visibility:
            return false
        case .temperatureFeels:
            return false
        case .cloudiness:
            return false
        case .sunset:
            return false
        case .rain:
            return false
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
