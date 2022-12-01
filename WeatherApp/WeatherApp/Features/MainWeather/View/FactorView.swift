import SwiftUI

struct FactorView: View {
    @State var factor: Factor
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
                Text(factor.value)
                    .modifier(TitleModifiers())
                    .frame(
                        maxWidth: .infinity,
                        maxHeight: .infinity,
                        alignment: .center
                    ).padding(.leading, 5)
                Text(factor.description)
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
        FactorView(factor: .rain(rain: 20)).frame(maxWidth: 200)
    }
}
