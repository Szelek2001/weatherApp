import SwiftUI

struct DailyView: View {
    var body: some View {
        ZStack {
            Color.black.opacity(0.2)
            VStack {
                ForEach(1...7, id: \.self) {_ in
                    Divider()
                    ZStack {
                        HStack(alignment: .center) {
                            Text("Poniedziałek")
                                .modifier(DescriptionModifiers(size: 20))
                            Spacer()
                            HStack(spacing: 16) {
                                Text("20")
                                    .modifier(DescriptionModifiers(size: 20, color: .gray))
                                Text("23")
                                    .modifier(DescriptionModifiers(size: 20))
                            }
                        }
                        .padding(10)
                        HStack(alignment: .center) {
                            Spacer()
                            Icon.sun
                                .font(.title)
                            Spacer()
                        }
                    }
                    .frame( minHeight: 0, maxHeight: 30)
                }
            }.padding(10)
        }.cornerRadius(25)
            .padding([.leading, .trailing], 20)
    }
}

struct DailyView_Previews: PreviewProvider {
    static var previews: some View {
        DailyView()
    }
}
