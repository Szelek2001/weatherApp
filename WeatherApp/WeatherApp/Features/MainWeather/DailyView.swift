import SwiftUI

struct DailyView: View {
    var body: some View {
        ZStack {
            Color.black.opacity(0.1)
            VStack {
                ForEach(1...7, id: \.self) {_ in
                    Divider()
                    ZStack {
                        HStack(alignment: .center) {
                            Text("Poniedziałek")
                                .font(.system(size: 20, weight: .semibold, design: .monospaced))
                            Spacer()
                            HStack(spacing: 16) {
                                Text("20")
                                    .font(.system(size: 20, weight: .semibold, design: .monospaced))
                                    .foregroundColor(.blue)
                                    .opacity(0.3)
                                Text("23")
                                    .font(.system(size: 20, weight: .semibold, design: .monospaced))
                                    .foregroundColor(.white)
                            }
                        }
                        .padding(10)
                        HStack(alignment: .center) {
                            Spacer()
                            Icon.sun
                                .font(.title)
                            Spacer()
                        }
                    }.frame( minHeight: 0, maxHeight: 30)
                }
            }.padding(10)
        }.cornerRadius(25)
            .padding(10)
    }
}

struct DailyView_Previews: PreviewProvider {
    static var previews: some View {
        DailyView()
    }
}
