import SwiftUI

struct CurrentForecastView: View {
    var body: some View {
        VStack {
            Text("Wrocław")
                .font(.system(size: 36, weight: .semibold, design: .monospaced))
                .foregroundColor(.white)
            Text("10°C")
                .font(.system(size: 50, weight: .medium, design: .monospaced))
                .foregroundColor(.white)
            Text("Od 5°C Do 22°C")
                .font(.system(size: 15, weight: .semibold, design: .monospaced))
                .foregroundColor(.white)
            Spacer()
            Icon.sun.font(.system(size: 100))
        }
    }
}

struct CurrentForecastView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentForecastView()
    }
}
