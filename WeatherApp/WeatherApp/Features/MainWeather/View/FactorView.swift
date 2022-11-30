import SwiftUI

struct FactorView: View {
    @State var factor: Factor
    @State var value: String
    @State var description: String
    var body: some View {
        GeometryReader { geo in
            VStack(alignment: .leading) {
                HStack {
                    factor.image
                    Text(factor.name)
                }.padding(.leading, 5)
                Divider()
                    .foregroundColor(.gray)
                    .modifier(DescriptionModifiers())
                    .frame(
                        maxHeight: .infinity,
                        alignment: .top
                    ).padding(.leading, 5)
                Text(value)
                    .modifier(TitleModifiers())
                    .frame(
                        maxWidth: .infinity,
                        maxHeight: .infinity,
                        alignment: .center
                    ).padding(.leading, 5)
                Text(description)
                    .modifier( DescriptionModifiers())
                    .lineLimit(2)
                    .frame(
                        maxWidth: .infinity,
                        minHeight: 40,
                        maxHeight: .infinity,
                        alignment: .bottom
                    ).padding(.leading, 5)
            }.padding(10)
                .frame(
                    width: geo.size.width,
                    height: geo.size.height,
                    alignment: .topLeading)
        }.background(.ultraThinMaterial)
            .frame( height: 160)
            .cornerRadius(25)
            .colorScheme(.dark)
    }
}
struct FactorView_Previews: PreviewProvider {
    static var previews: some View {
        FactorView(factor: .temperatureFeels, value: "200", description: "").frame(maxWidth: 200)
    }
}
