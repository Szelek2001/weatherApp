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
        let mainWeatherViewModel = MainWeatherViewModel()

        WindowGroup {
            TabView() {
                MainWeatherView(viewModel: mainWeatherViewModel)
                    .tabItem {
                        Symbols.map
                    }
                MainWeatherView(viewModel: mainWeatherViewModel)
                    .tabItem {
                        Symbols.location
                    }
                Studia()
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
