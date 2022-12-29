import SwiftUI
import MapKit

struct PlusButtonView: View {
    @Binding var region: MKCoordinateRegion
    @Binding var showingAddingSheet: Bool
    @ObservedObject var viewModel: MapViewModel
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button {
                    let newPlace = Place(name: "", latitude: region.center.latitude, longitude: region.center.longitude)
                    viewModel.place = newPlace
                    showingAddingSheet = true
                }
            label: {
                Image(systemName: "plus")
                    .padding()
                    .background(Color.black.opacity(0.75))
                    .foregroundColor(.white)
                    .clipShape(Circle())
            }
                Spacer()
            }.padding()
        }
    }
}

struct PlusButtonView_Previews: PreviewProvider {
    static var previews: some View {
        PlusButtonView(region: .constant(MKCoordinateRegion(center:
                                                                CLLocationCoordinate2D(latitude: 50.9077147, longitude: 14.9539185),
                                                            span: MKCoordinateSpan(latitudeDelta: 0.7, longitudeDelta: 0.7))), showingAddingSheet: .constant(true), viewModel: MapViewModel())
    }
}
