import SwiftUI

@main
struct WeatherAppApp: App {
    init() {
        let apparance = UITabBarAppearance()
        apparance.backgroundEffect = UIBlurEffect(style: .systemUltraThinMaterial)
        apparance.backgroundColor = UIColor(Color.blue.opacity(0.1))
        UITabBar.appearance().standardAppearance = apparance
        UITabBar.appearance().scrollEdgeAppearance = apparance
    }
    var body: some Scene {
//        let mainWeatherViewModel = MainWeatherViewModel(
//            dataService:
//                MockCurrentWeatherService()
////                DataService(url: URL(string:"https://api.openweathermap.org/data/2.5/weather?lat=50.9077147&lon=14.9539185&appid=56b1b78832cd635820598c676cfc2ff3&units=metric&lang=pl")!)
//            ,dataService2: DataService(url: URL(string: "api.openweathermap.org/data/2.5/forecast?lat=5.9077147&lon=4.9539185&appid=56b1b78832cd635820598c676cfc2ff3&units=metric")!)
//        )
        
        let mainWeatherViewModel = MainWeatherViewModel(dataService: MockCurrentWeatherService(), dataService2: MockHourlyService())

        WindowGroup {
            TabView {
                MainWeatherView(viewModel: mainWeatherViewModel)
                    .tabItem {
                        Symbols.map
                    }
                MainWeatherView(viewModel: mainWeatherViewModel)
                    .tabItem {
                        Symbols.location
                    }
                MainWeatherView(viewModel: mainWeatherViewModel)
                    .tabItem {
                        Symbols.listBullet
                    }
            }.background(Color.red)
                .task {
                    await mainWeatherViewModel.loadJson()
                    await mainWeatherViewModel.loadJson2()
                }
        }
    }
}
