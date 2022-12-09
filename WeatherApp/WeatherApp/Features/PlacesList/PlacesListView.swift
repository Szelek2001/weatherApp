import SwiftUI

struct PlacesListView: View {
    @ObservedObject var viewModel: MapViewModel
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(viewModel.places) { place in
                        NavigationLink(
                            destination: SwiftUIView(),
                            label: {
                                Text(place.name)
                                Text(String(place.latitude))
                                Text(String(place.longitude))

                            })
                    }.onDelete(perform: removePlaces)
                }
            }
            .navigationTitle("Bucket List")
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
