import SwiftUI

@main
struct WeatherAppApp: App {
    @State private var selection = 2
    init() {
        let apparance = UITabBarAppearance()
        apparance.backgroundEffect = UIBlurEffect(style: .systemUltraThinMaterial)
        apparance.backgroundColor = UIColor(Color.blue.opacity(0.1))
        UITabBar.appearance().standardAppearance = apparance
        UITabBar.appearance().scrollEdgeAppearance = apparance
    }
    var body: some Scene {
        let mainWeatherViewModel = MainWeatherViewModel(
            currentDataService:
                DataService(url: URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(Double( UserDefaults.location.0!))&lon=\(Double( UserDefaults.location.1!))&appid=56b1b78832cd635820598c676cfc2ff3&units=metric&lang=pl")!),
            foreacastDataService: DataService(url: URL(string: "https://api.openweathermap.org/data/2.5/forecast?lat=\(Double( UserDefaults.location.0!))&lon=\(Double( UserDefaults.location.1!))&appid=56b1b78832cd635820598c676cfc2ff3&units=metric")!)
       )
//        let mainWeatherViewModel = MainWeatherViewModel(currentDataService: MockCurrentWeatherService(), foreacastDataService: MockHourlyService())

        WindowGroup {
            TabView(selection: $selection) {
                MainWeatherView(viewModel: mainWeatherViewModel)
                    .tabItem {
                        Symbols.map
                    }.tag(1)
                MainWeatherView(viewModel: mainWeatherViewModel)
                    .tabItem {
                        Symbols.location
                    }.tag(2)
                MainWeatherView(viewModel: mainWeatherViewModel)
                    .tabItem {
                        Symbols.listBullet
                    }
            }.background(Color.red)
                .task {
                    await mainWeatherViewModel.loadCurrentJson()
                    await mainWeatherViewModel.loadForecastJson()
                }
                .onAppear {
                    selection = 2
                }
        }
    }
}
