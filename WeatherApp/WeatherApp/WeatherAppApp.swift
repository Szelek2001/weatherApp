import SwiftUI

@main
struct WeatherAppApp: App {
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
            }
            //.accentColor(.green)
            .onAppear(
            // fetch data
            )
        }
    }
}
