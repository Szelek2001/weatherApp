import SwiftUI

struct HourlyView: View {
    @State var weather: [List]
    var body: some View {
        VStack {
            HStack {
                Symbols.clock
                Text(Subtitles.hourlyForecast)
            }.frame(
                maxWidth: .infinity,
                alignment: .leading
            ).padding([.top, .leading, .trailing], 10)
                .padding(.leading, 5)
                .modifier(DescriptionModifiers(isShadow: true))
            Divider()
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(weather.prefix(upTo: 10), id: \.self) { hour in
                        VStack(spacing: 12) {
                            var weatherType = MainWeatherViewModel().setupWeatherType(icon: hour.weather.first?.icon) // może inaczej
                            Text(MainWeatherViewModel().convertUNIXToHourAndMin(unix: hour.dataTime))
                                .modifier(DescriptionModifiers())
                            weatherType.icon.frame(maxHeight: .infinity)
                            Text(String(Int(hour.main.temp)) + Units.celsius ).modifier(DescriptionModifiers())
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
