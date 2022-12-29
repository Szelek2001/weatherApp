import SwiftUI

struct MainWeatherView: View {
    @StateObject var viewModel: MainWeatherViewModel
    @State var showSheet = false
    var body: some View {
        ZStack {
            LinearGradient(
                colors: viewModel.currentWeather?.backgroundColor ?? [.blue, .white],
                startPoint: .top,
                endPoint: .bottom)
            .opacity(0.70)
            .ignoresSafeArea()
            ScrollView {
                VStack {
                    CurrentForecastView()
                        .environmentObject(viewModel)
                    if viewModel.currentData != nil && viewModel.foreacastWeather != nil {
                        HourlyView()
                            .environmentObject(viewModel)
                            .padding(.bottom, 10)
                        DailyView()
                            .environmentObject(viewModel)
                        VStack {
                            HStack {
                                FactorView(
                                    factor: .rain(rain: viewModel.rain)
                                )
                                .onTapGesture {
                                    showSheet = true
                                }
                                FactorView(factor: .wind(speed: viewModel.windSpeed)
                                )
                                .onTapGesture {
                                    showSheet = true
                                }
                            }
                            .padding([.leading, .trailing], 20)
                            .padding([.top, .bottom], 10)
                            HStack {
                                FactorView(
                                    factor: .temperatureFeels(
                                        temperature: viewModel.temperature,
                                        temperatureFeels: viewModel.temperatureFeels)
                                )
                                FactorView(
                                    factor: .pressure(pressure: viewModel.pressure)
                                )
                            }.padding([.leading, .trailing], 20)
                                .padding([ .bottom], 10)
                            HStack {
                                FactorView(
                                    factor: .sunrise(sunrise: viewModel.sunrise, sunset: viewModel.sunset)
                                )
                                FactorView(factor: .cloudiness(level: viewModel.cloudiness)
                                )
                            }.padding([.leading, .trailing], 20)
                                .padding([ .bottom], 10)
                            HStack {
                                FactorView(
                                    factor: .humidity(humidity: viewModel.humidity)
                                )
                                FactorView(
                                    factor: .visibility(visibility: viewModel.visibility)
                                )
                            }.padding([.leading, .trailing], 20)
                        }}
                }
            }
            .padding(.top, 1)
        }
        .sheet(isPresented: self.$showSheet) {
            Text("To jest dany text")
        }
        .redacted(
            reason: viewModel.currentData == nil ? .placeholder : []
        )
    }
}

struct MainWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        MainWeatherView(viewModel: MainWeatherViewModel(currentDataService: MockCurrentWeatherService(), foreacastDataService: MockHourlyService()))
    }
}
