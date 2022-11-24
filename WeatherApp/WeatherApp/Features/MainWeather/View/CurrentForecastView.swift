import SwiftUI

struct CurrentForecastView: View {
    @State var city: String
    @State var temperature: String
    @State var description: String
    @State var weatherIcon: Image
    @State var maxTemperature: Int
    @State var minTemperature: Int
    var body: some View {
        VStack {
            Text(city)
                .modifier(TitleModifiers(size: 50))
            Text(temperature + Units.celsius)
                .modifier(TitleModifiers())
            Spacer()
            weatherIcon.font(.system(size: 100))
            Spacer()
            Text(Subtitles.from + String(minTemperature) + Units.celsius + Subtitles.until + String(maxTemperature) + Units.celsius)
                .modifier(DescriptionModifiers(isShadow: true))
                .opacity(0.9)
            Text(description)
                .modifier(DescriptionModifiers(isShadow: true))
                .opacity(0.9)
        }
    }
}

struct CurrentForecastView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentForecastView(city: "Wrocław", temperature: "13°C", description: "Leje ale nie jest źle", weatherIcon: Icon.sun, maxTemperature: 5, minTemperature: 8)
    }
}
