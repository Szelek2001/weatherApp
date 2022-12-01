import SwiftUI

struct HourlyView: View {
    @EnvironmentObject var viewModel: MainWeatherViewModel
    var body: some View {
        VStack {
            HStack {
                Symbols.clock
                Text(Subtitles.hourlyForecast)
            }.frame(
                maxWidth: .infinity,
                alignment: .leading
            ).padding([.top, .trailing], 10)
                .padding(.leading, 15)
                .modifier(DescriptionModifiers(isShadow: true))
            Divider()
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(viewModel.foreacastWeather!.list.prefix(upTo: 10), id: \.self) { hour in
                        VStack(spacing: 12) {
                            let weatherType = viewModel.setupWeatherType(icon: hour.weather.first?.icon)
                            Text(verbatim: .convertUNIXToFormat(
                                unix: hour.dataTime,
                                format: "HH:mm")
                            )
                                .modifier(DescriptionModifiers())
                            weatherType.icon
                                .frame(maxHeight: .infinity)
                            Text(String(Int(hour.main.temp)) + Units.celsius )
                                .modifier(DescriptionModifiers())
                        }
                    }.padding(5)
                }
                .padding(.bottom, 5)
                .padding([.trailing, .leading])
            }.frame(height: 100)
        }   .background(.ultraThinMaterial)
            .cornerRadius(25)
            .padding([.leading, .trailing], 20)
            .colorScheme(.dark)
    }
}
// struct HourlyView_Previews: PreviewProvider {
//    static var previews: some View {
//        HourlyView(weather: )
//    }
// }
