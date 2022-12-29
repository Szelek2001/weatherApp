import SwiftUI

struct PlacesListView: View {
    @ObservedObject var viewModel: MapViewModel
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(viewModel.places) { place in
                        Button {
                            UserDefaults.latitude = place.latitude
                            UserDefaults.longitude = place.longitude
                        } label: { Text(place.name)
                            Text(
                                String(round(place.latitude * 100)/100) + String(" ") +
                                String(round(place.longitude * 100)/100)
                            )
                        }
                    }.onDelete(perform: removePlaces)
                }
            }
            .navigationTitle("Lista miejsc")
            .navigationBarItems(trailing: EditButton())
        }
    }
    func removePlaces(of offsets: IndexSet) {
        viewModel.places.remove(atOffsets: offsets)
    }
}

struct PlacesListView_Previews: PreviewProvider {
    static var previews: some View {
        PlacesListView(viewModel: MapViewModel())
    }
}
