import SwiftUI

struct CurrentForecastView: View {

    @EnvironmentObject var viewModel: MainWeatherViewModel
    var body: some View {
        VStack {
            Text(viewModel.currentData?.name  ?? .placeholder(length: 10))
                .modifier(TitleModifiers(size: 50))
            Text(String(Int(viewModel.currentData?.main.temp ?? 2)) + Units.celsius)
                .modifier(TitleModifiers())
            Spacer()
            (viewModel.currentWeather?.icon ?? Symbols.sunrise).font(.system(size: 100))
            Spacer()
            Text(Subtitles.from + String(Int(viewModel.currentData?.main.tempMin ?? .zero))
                 + Units.celsius + Subtitles.until + String(Int(viewModel.currentData?.main.tempMax ?? .zero))
                 + Units.celsius)
                .modifier(DescriptionModifiers(isShadow: true))
                .opacity(0.9)
            Text(viewModel.currentData?.weather.first?.description ?? .placeholder(length: 25))
                .modifier(DescriptionModifiers(isShadow: true))
                .opacity(0.9)
        }
    }
}

// struct CurrentForecastView_Previews: PreviewProvider {
//    static var previews: some View {
//        CurrentForecastView(city: "Wrocław", temperature: "13°C", description: "Leje ale nie jest źle", weatherIcon: Icon.sun, maxTemperature: 5, minTemperature: 8)
//    }
// }
