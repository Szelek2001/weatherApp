import SwiftUI

struct MainWeatherView: View {
    @StateObject var viewModel: MainWeatherViewModel
    @State var showSheet = false
    @State var weatherType: WeatherType = .thunderstorm
    var body: some View {
        ZStack {
            LinearGradient(
                colors: weatherType.backgroundColor,
                startPoint: .top,
                endPoint: .bottom)
            .opacity(0.70)
            .ignoresSafeArea()
            ScrollView {
                VStack {
                    CurrentForecastView(
                        city: viewModel.currentData?.name  ?? .placeholder(length: 10),
                        temperature: "13°C",
                        description: viewModel.currentData?.weather.first?.description ?? .placeholder(length: 25),
                        weatherIcon: weatherType.icon,
                        maxTemperature: 5,
                        minTemperature: 8
                    )
                    HourlyView()
                        .padding(.bottom, 10)
                    DailyView()
                    HStack {
                        FactorView(factor: .rain).onTapGesture {
                            showSheet = true
                        }
                        FactorView(factor: .wind)
                    }
                    .padding([.leading, .trailing], 20)
                    .padding([.top, .bottom], 10)
                    HStack {
                        FactorView(factor: .temperatureFeels)
                        FactorView(factor: .pressure)
                    }.padding([.leading, .trailing], 20)
                        .padding([ .bottom], 10)
                    HStack {
                        FactorView(factor: .sunrise)
                        FactorView(factor: .cloudiness)
                    }.padding([.leading, .trailing], 20)
                        .padding([ .bottom], 10)
                    HStack {
                        FactorView(factor: .humidity)
                        FactorView(factor: .visibility)
                    }.padding([.leading, .trailing], 20)
                }
            }.padding(.top, 1)
        }.sheet(isPresented: self.$showSheet) {
            Text("To jest dany text")
            
        }
        .redacted(reason: viewModel.currentData == nil ? .placeholder : [])
    }
}

struct MainWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        MainWeatherView(viewModel: MainWeatherViewModel())
    }
}
