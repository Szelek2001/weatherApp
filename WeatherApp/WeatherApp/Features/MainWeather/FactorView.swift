import SwiftUI

struct FactorView: View {
    @State var factor: Factor
    var body: some View {
        GeometryReader { geo in
            VStack(alignment: .leading) {
                HStack {
                    factor.image
                    Text(factor.name)
                }
                Divider()
                    .foregroundColor(.gray)
                    .modifier(DescriptionModifiers())
                    .frame(maxHeight: .infinity, alignment: .top)
                Text(factor.value)
                    .modifier(TitleModifiers())
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: factor.unit ? .center : .leading)
                Text(factor.description)
                    .modifier( DescriptionModifiers())
                    .lineLimit(2, reservesSpace: true)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: factor.unit ? .center : .leading)
            }.padding(10)
                .frame(
                    width: geo.size.width,
                    height: geo.size.height,
                    alignment: .topLeading)
        }.background(.ultraThinMaterial)
            .frame( height: 150)
            .cornerRadius(25)
            .colorScheme(.dark)
    }
}
struct FactorView_Previews: PreviewProvider {
    static var previews: some View {
        FactorView(factor: .pressure)
    }
}
