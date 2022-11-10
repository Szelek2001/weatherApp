import SwiftUI

struct CurrentForecastView: View {
    @State var city: String
    @State var temperature: String
    @State var description: String
    @State var maxTemperature: Int
    @State var minTemperature: Int
    var body: some View {
        VStack {
            Text(city)
                .modifier(TitleModifiers(size: 50))
            Text(temperature)
                .modifier(TitleModifiers())
            Spacer()
            Icon.sun.font(.system(size: 100))
            Spacer()
            Text("Od \(minTemperature) do \(maxTemperature)")
                .modifier(DescriptionModifiers(color: .blue))
                .opacity(0.5)
            Text(description)
                .modifier(DescriptionModifiers(color: .blue))
                .opacity(0.5)
        }
    }
}

struct CurrentForecastView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentForecastView(city: "Wrocław", temperature: "13°C", description: "Leje ale nie jest źle", maxTemperature: 5, minTemperature: 8)
    }
}
