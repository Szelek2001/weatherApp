import SwiftUI
import MapKit

struct CurrentLocationInfo: View {
    @Binding var region: MKCoordinateRegion
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 3) {
                HStack {
                    Text("Szerokość geograficzna: ")
                        .modifier(DescriptionModifiers())
                    Spacer()
                    Text("\(region.center.latitude)")
                        .modifier(DescriptionModifiers(size: 12))
                }
                Divider()
                HStack {
                    Text("Długość geograficzna: ")
                        .modifier(DescriptionModifiers())
                    Spacer()
                    Text("\(region.center.longitude)")
                        .modifier(DescriptionModifiers(size: 12))
                }
            }
            .padding()
            .background(
                Color.black
                    .cornerRadius(20)
                    .opacity(0.5)
            )
            .padding()
            Spacer()
        }
    }
}

struct CurrentLocationInfo_Previews: PreviewProvider {
    static var previews: some View {
        CurrentLocationInfo(region: .constant(MKCoordinateRegion(center:
                            CLLocationCoordinate2D(latitude: 50.9077147, longitude: 14.9539185),
                            span: MKCoordinateSpan(latitudeDelta: 0.7, longitudeDelta: 0.7))))
    }
}
