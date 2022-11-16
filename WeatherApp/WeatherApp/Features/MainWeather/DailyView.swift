import SwiftUI

struct DailyView: View {
    var body: some View {
        VStack {
            HStack {
                Symbols.calendar
                Text("10 dniowa prognoza")
            }.frame(maxWidth: .infinity, alignment: .leading).padding(10)
                .modifier(DescriptionModifiers(isShadow: true))
            ForEach(1...7, id: \.self) {_ in
                Divider()
                HStack(alignment: .center) {
                    Text("Pon.")
                        .modifier(DescriptionModifiers(size: 20))
                    Spacer()
                    Icon.sun
                        .font(.title)
                    Spacer()
                    HStack(spacing: 16) {
                        Text("20")
                            .modifier(DescriptionModifiers(size: 20, color: .white))
                            .opacity(0.8)
                        ZStack(alignment: .leading) {
                            Capsule().fill(.tertiary).foregroundColor(.white)
                            GeometryReader { reader in
                                Capsule()
                                .fill(.linearGradient(.init(colors: [.orange, .red]), startPoint: .leading, endPoint: .trailing)).frame(maxWidth: reader.size.width).frame(width: ((20+20)/60) * (reader.size.width)) } //zmiana koloru na niebieski gdy jest ujemna 
                        }.frame(height: 4)
                        Text("23")
                            .modifier(DescriptionModifiers(size: 20))
                    }
                }
                .padding(15)
                .frame( minHeight: 0, maxHeight: 35)
            }
            Divider()
        }.background(.ultraThinMaterial)
            .cornerRadius(25)
            .padding([.leading, .trailing], 20)
            .colorScheme(.dark)
    }
}

struct DailyView_Previews: PreviewProvider {
    static var previews: some View {
        DailyView()
    }
}
