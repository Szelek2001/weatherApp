import SwiftUI

struct DailyView: View {
    @EnvironmentObject var viewModel: MainWeatherViewModel
    var body: some View {
        VStack {
            HStack {
                Symbols.calendar
                Text(Subtitles.weeklyForecast)
            }.frame(maxWidth: .infinity, alignment: .leading).padding(10)
                .modifier(DescriptionModifiers(isShadow: true))
                .padding(.leading, 5)
            ForEach(viewModel.foreacastWeather!.list, id: \.self) { day in
                if String.convertUNIXToFormat(unix: day.dataTime, format: "HH") == "13" {
                    let temperatureSize = day.main.temp > 30  || day.main.temp < -14 ? CGFloat(1) : CGFloat((15 + day.main.temp)/45)
                    Divider()
                    HStack(alignment: .center) {
                        Text(verbatim: .convertUNIXToFormat(
                            unix: day.dataTime,
                            format: "E")
                        )
                        .modifier(DescriptionModifiers(size: 20))
                        .frame(width: 60, alignment: .leading)
                        Spacer()
                        viewModel.setupWeatherType(icon: day.weather.first?.icon).icon
                            .font(.title).frame(width: 50, alignment: .leading)
                        Spacer()
                        HStack(spacing: 16) {
                            Text(String(Int(day.main.feelLike)) + Units.temperature)
                                .modifier(DescriptionModifiers(size: 20, color: .white))
                                .opacity(0.8)
                            ZStack(alignment: .leading) {
                                Capsule()
                                    .fill(.tertiary)
                                    .foregroundColor(.white)
                                GeometryReader { reader in
                                    Capsule()
                                        .fill(
                                            .linearGradient(
                                                .init(
                                                    colors: day.main.temp >= 0 ? [.orange, .red] : [.blue, . gray]),
                                                startPoint: .leading,
                                                endPoint: .trailing
                                            )
                                        )
                                        .frame(maxWidth: reader.size.width)
                                        .frame(
                                            width: temperatureSize * reader.size.width)
                                }
                            }.frame(height: 4)
                            Text(String(Int(day.main.temp)) + Units.temperature)
                                .modifier(DescriptionModifiers(size: 20))
                        }
                    }
                    .padding(15)
                    .frame( minHeight: 0, maxHeight: 35)
                } }
            Divider()
        }.background(.ultraThinMaterial)
            .cornerRadius(25)
            .padding([.leading, .trailing], 20)
            .colorScheme(.dark)
    }
}
//
// struct DailyView_Previews: PreviewProvider {
//    static var previews: some View {
//        DailyView()
//    }
// }
