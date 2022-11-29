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
                    if(viewModel.currentData != nil && viewModel.foreacastWeather != nil) {
                    HourlyView()
                        .environmentObject(viewModel)
                        .padding(.bottom, 10)
                    
                        DailyView(weather: viewModel.foreacastWeather!.list)
                    
                        VStack {
                            HStack {
                                FactorView(
                                    factor: .rain,
                                    value: viewModel.makeFactorValue(factor: .rain),
                                    description: viewModel.makeFactorDescription(factor: .rain)
                                )
                                .onTapGesture {
                                    showSheet = true
                                }
                                FactorView(factor: .wind,
                                           value: viewModel.makeFactorValue(factor: .wind),
                                           description: viewModel.makeFactorDescription(factor: .wind)
                                )
                            }
                            .padding([.leading, .trailing], 20)
                            .padding([.top, .bottom], 10)
                            HStack {
                                FactorView(
                                    factor: .temperatureFeels,
                                    value: viewModel.makeFactorValue(factor: .temperatureFeels),
                                    description: viewModel.makeFactorDescription(factor: .temperatureFeels)
                                )
                                FactorView(
                                    factor: .pressure,
                                    value: viewModel.makeFactorValue(factor: .pressure),
                                    description: viewModel.makeFactorDescription(factor: .pressure)
                                )
                            }.padding([.leading, .trailing], 20)
                                .padding([ .bottom], 10)
                            HStack {
                                FactorView(
                                    factor: .sunrise,
                                    value: viewModel.makeFactorValue(factor: .sunrise),
                                    description: viewModel.makeFactorDescription(factor: .sunrise)
                                )
                                FactorView(factor: .cloudiness,
                                           value: viewModel.makeFactorValue(factor: .cloudiness),
                                           description: viewModel.makeFactorDescription(factor: .cloudiness)
                                )
                            }.padding([.leading, .trailing], 20)
                                .padding([ .bottom], 10)
                            HStack {
                                FactorView(
                                    factor: .humidity,
                                    value: viewModel.makeFactorValue(factor: .humidity),
                                    description: viewModel.makeFactorDescription(factor: .humidity)
                                )
                                FactorView(factor: .visibility,
                                           value: viewModel.makeFactorValue(factor: .visibility),
                                           description: viewModel.makeFactorDescription(factor: .visibility)
                                )
                            }.padding([.leading, .trailing], 20)
                        }}
                }
            }
            .padding(.top, 1)
            .refreshable {
                await viewModel.loadJson()
                
            }
        }.sheet(isPresented: self.$showSheet) {
            Text("To jest dany text")
        }
        .redacted(reason: viewModel.currentData == nil ? .placeholder : [])
    }
}

 struct MainWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        MainWeatherView(viewModel: MainWeatherViewModel(dataService: MockCurrentWeatherService(), dataService2:  MockHourlyService()))
    }
}
