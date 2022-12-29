import Foundation
import SwiftUI
import Combine
import CoreLocation

class MainWeatherViewModel: ObservableObject {
    @Published var currentData: CurrentData? {
        didSet {
            currentWeather = setupWeatherType(icon: currentData?.weather.first!.icon)
            visibility = (currentData?.visibility ?? .zero)/1000
            pressure = currentData?.main.pressure ?? .zero
            windSpeed = Int(currentData?.wind.speed ?? .zero)
            humidity = currentData?.main.humidity ?? .zero
            temperatureFeels = Int(currentData?.main.feelLike ?? .zero)
            cloudiness = currentData?.clouds.all ?? .zero
            sunrise = .convertUNIXToFormat(
                unix: currentData?.sys.sunrise ?? .zero,
                format: "HH:mm")
            sunset = .convertUNIXToFormat(
                unix: currentData?.sys.sunset ?? .zero,
                format: "HH:mm")
            rain = Int(currentData?.rain?.oneHour ?? .zero)
            temperature = Int(currentData?.main.temp ?? .zero)
            temperatureMin = Int(currentData?.main.tempMin ?? .zero)
            temperatureMax = Int(currentData?.main.tempMax ?? .zero)
        }
    }
    @Published var currentWeather: WeatherType?
    @Published var foreacastWeather: ThreeHoursData?
    @Published var dailyForecastWeather: ThreeHoursData?
    private var cancellables = Set<AnyCancellable>()
    private var cancellables2 = Set<AnyCancellable>()
    private(set) var visibility: Int!
    private(set) var pressure: Int!
    private(set) var windSpeed: Int!
    private(set) var humidity: Int!
    private(set) var temperatureFeels: Int!
    private(set) var cloudiness: Int!
    private(set) var sunrise: String!
    private(set) var sunset: String!
    private(set) var rain: Int!
    private(set) var temperature: Int!
    private(set) var temperatureMin: Int!
    private(set) var temperatureMax: Int!
    var currentDataService: DataServiceProtocol
    var foreacastDataService: DataServiceProtocol
    init(currentDataService: DataServiceProtocol, foreacastDataService: DataServiceProtocol) {
        self.currentDataService = currentDataService
        self.foreacastDataService = foreacastDataService
    }
    func loadCurrentJson() async {
        await currentDataService.getData()
            .sink { error in
                print(error)
            } receiveValue: { [weak self] currentWeather in
                self?.currentData = currentWeather
            }
            .store(in: &cancellables)
    }
    func loadForecastJson() async {
        await foreacastDataService.getData()
            .sink { error in
                print(error)
            } receiveValue: { [weak self] foreacastWeather in
                self?.foreacastWeather = foreacastWeather
            }
            .store(in: &cancellables2)
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
}
enum Subtitles {
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
    static let temperature = "°"
}

enum Factor {
    case wind(speed: Int)
    case pressure(pressure: Int)
    case humidity(humidity: Int)
    case visibility(visibility: Int)
    case temperatureFeels(temperature: Int, temperatureFeels: Int)
    case cloudiness(level: Int)
    case sunrise(sunrise: String, sunset: String)
    case rain(rain: Int)
    var description: String {
        switch self {
        case .wind:
            return Subtitles.kpH
        case .pressure:
            return Subtitles.hPA
        case .humidity:
            return Subtitles.waterVapourConcentration
        case .visibility(let visibility):
            if visibility < 10 {
                return Subtitles.badVisibility }
            if visibility > 30 {
                return Subtitles.greatVisibility
            }
            return Subtitles.averageVisibility
        case .temperatureFeels(let temperature, let temperatureFeels):
            if temperatureFeels > temperature {
                return Subtitles.warmerBecauseHumidity
            } else if temperatureFeels < temperature {
                return Subtitles.colderBecauseWind
            } else {
                return Subtitles.fellHowItIs }
        case .cloudiness(let cloudiness):
            if cloudiness == 0 {
                return Subtitles.cloudlessSky }
            return Subtitles.cloudinessLevel
        case .sunrise(_, let sunset):
            return Subtitles.sunset + sunset
        case .rain:
            return Subtitles.last24Hours
        }
    }
    var value: String {
        switch self {
        case .wind(let speed):
            return String(speed)
        case .pressure(let pressure):
            return String(pressure)
        case .humidity(let humidity):
            return String(humidity) + Units.percent
        case .visibility(let visibility):
            return String(visibility) + Units.kilometers
        case .temperatureFeels(_, let temperatureFeels):
            return String(temperatureFeels) + Units.celsius
        case .cloudiness(let cloudiness):
            return String(cloudiness) + Units.percent
        case .sunrise(let sunrise, _):
            return sunrise
        case .rain(let rain):
            return String(rain) + Units.milimiters
        }}
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
