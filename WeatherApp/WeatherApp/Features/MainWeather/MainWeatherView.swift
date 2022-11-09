import SwiftUI

struct MainWeatherView: View {
    var body: some View {
            ZStack {
                LinearGradient(
                    colors: [.blue, .black],
                    startPoint: .top,
                    endPoint: .bottom)
                .opacity(0.3)
                .ignoresSafeArea()
                ScrollView {
                    VStack {
                        CurrentForecastView()
                        HourlyView()
                        DailyView()
                        HStack {
                            FactorView()
                            FactorView()
                        }
                        HStack {
                            FactorView()
                            FactorView()
                        }
                        HStack {
                            FactorView()
                            FactorView()
                        }
                    }
                }.padding(.top, 1)
            }
    }

}

struct MainWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        MainWeatherView()
    }
}
