import SwiftUI

struct MainWeatherView: View {
    @State var showSheet = false
    var body: some View {
            ZStack {
                LinearGradient(
                    colors: [.blue, .white],
                    startPoint: .top,
                    endPoint: .bottom)
                .opacity(0.3)
                .ignoresSafeArea()
                ScrollView {
                    VStack {
                        CurrentForecastView(city: "Wrocław", temperature: "13°C", description: "Leje ale nie jest źle", maxTemperature: 5, minTemperature: 8)
                        HourlyView()
                        DailyView()
                        HStack {
                            FactorView(factor: .wind, desription: "lalalalla", valueOfFactor: "22°C").onTapGesture {
                                    showSheet = true
                            }
                            FactorView(factor: .wind, desription: "mucha", valueOfFactor: "22°C")
                        }
                        .padding([.leading, .trailing], 20)
                        .padding([.top, .bottom], 10)
                        HStack {
                            FactorView(factor: .wind, desription: "Punkt rosy to w tej chwili 9", valueOfFactor: "22°C")
                            FactorView(factor: .wind, desription: "Punkt rosy to w tej chwili 9", valueOfFactor: "22°C")
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
