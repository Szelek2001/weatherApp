import SwiftUI

struct FactorView: View {
    @State var factor: Factor
    @State var desription: String
    @State var valueOfFactor: String
    var body: some View {
        ZStack {
            GeometryReader { geo in
                Color.black.opacity(0.2)
                VStack(alignment: .leading) {
                    HStack {
                        factor.image
                        Text(factor.des)
                    }
                    .foregroundColor(.gray)
                    .modifier(DescriptionModifiers())
                    .frame(maxHeight: .infinity, alignment: .top)
                    Text(valueOfFactor)
                        .modifier(TitleModifiers())
                        .frame(maxHeight: .infinity, alignment: .center)
                    Text(desription)
                        .modifier(DescriptionModifiers())
                        .lineLimit(2, reservesSpace: true)
                        .frame(maxHeight: .infinity, alignment: .bottom)
                }.padding()
                .frame(
                    width: geo.size.width,
                    height: geo.size.height,
                    alignment: .topLeading)
            }
        }
        .frame( minHeight: 150, maxHeight: 150)
        .cornerRadius(25)
    }
}
struct FactorView_Previews: PreviewProvider {
    static var previews: some View {
        FactorView(factor: .wind, desription: "Punkt rosy to w tej chwili 9", valueOfFactor: "22°C")
    }
}
