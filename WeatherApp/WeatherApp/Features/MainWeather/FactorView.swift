import SwiftUI

struct FactorView: View {
    var body: some View {
        ZStack {
            GeometryReader { geo in
                Color.black.opacity(0.1)
                VStack(alignment: .leading) {
                    HStack {
                        Symbols.map
                        Text("OPADY")
                    }
                    .foregroundColor(.blue)
                    .font(.system(size: 20, weight: .semibold, design: .monospaced))
                    .opacity(0.3)
                    Text("10°C")
                        .font(.system(size: 40, weight: .bold, design: .monospaced))
                        .foregroundColor(.white)
                    Text("Od 5°C Do 22°Cjnjnjnjnjknjknjknkjnjknjknjknjknjknjk")
                        .font(.system(size: 20, weight: .semibold, design: .monospaced))
                        .foregroundColor(.white)
                }.padding()
                .frame(
                    width: geo.size.width,
                    height: geo.size.height,
                    alignment: .topLeading)
            }
        }
        .frame( minHeight: 150, maxHeight: 150)
        .cornerRadius(25).padding(10)
    }
}
struct FactorView_Previews: PreviewProvider {
    static var previews: some View {
        FactorView()
    }
}
