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
        WindowGroup {
            TabView {
                MainWeatherView()
                    .tabItem {
                        Symbols.map
                    }
                    MainWeatherView()
                        .tabItem {
                            Symbols.location
                        }
//                ForEach(1...2, id: \.self) {_ in
//                    ContentView()
//                        .tabItem {
//                            Symbols.circle.environment(\.symbolVariants, .circle)
//                        }
//                }
                MainWeatherView()
                        .tabItem {
                            Symbols.listBullet
                        }
            }.background(Color.red)

            // .accentColor(.green)
            .onAppear(
            // fetch data
            )
        }
    }
}

