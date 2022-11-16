import SwiftUI

struct MainWeatherView: View {
    @State var showSheet = false
    var body: some View {
            ZStack {
                LinearGradient(
                    colors: [.black, .blue],
                    startPoint: .top,
                    endPoint: .bottom)
                .opacity(0.3)
                .ignoresSafeArea()
                ScrollView {
                    VStack {
                            CurrentForecastView(city: "Wrocław", temperature: "13°C", description: "Leje ale nie jest źle", maxTemperature: 5, minTemperature: 8)
                        HourlyView().padding(.bottom, 10)
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
                            FactorView(factor: .sunset)
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
    }

}

struct MainWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        MainWeatherView()
    }
}
