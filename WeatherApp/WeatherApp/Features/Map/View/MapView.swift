import SwiftUI
import MapKit

struct MapView: View {
    @State var region: MKCoordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.334900, longitude: -122.009033),
        span: MKCoordinateSpan(latitudeDelta: 0.075, longitudeDelta: 0.075))
    @State var userTrackingMode: MapUserTrackingMode = .follow
    @State var showingInformation: Bool = false
    @State private var showingAddingSheet = false
    @ObservedObject var viewModel: MapViewModel
    var body: some View {
        ZStack {
            Map(
                coordinateRegion: $region,
                interactionModes: MapInteractionModes.all,
                showsUserLocation: true,
                userTrackingMode: $userTrackingMode,
                annotationItems: viewModel.places) {
                    MapMarker(coordinate: $0.coordinate)
            }
            .ignoresSafeArea(.all)
            CurrentLocationInfo(region: $region)
            Crosshair()
            PlusButtonView(region: $region, showingAddingSheet: $showingAddingSheet, viewModel: viewModel)
        }
        .sheet(isPresented: $showingAddingSheet, content: {
            AddNewPlaceView(viewModel: viewModel)
        })
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(viewModel: MapViewModel())
    }
}
