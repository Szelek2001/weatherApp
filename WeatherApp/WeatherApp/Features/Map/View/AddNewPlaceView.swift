import SwiftUI

struct AddNewPlaceView: View {
    @ObservedObject var viewModel: MapViewModel
    @State private var nameField = ""
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Place name", text: $nameField)
                }
            }
            .navigationTitle("Dodaj nowe miejsce")
            .navigationBarItems(trailing: Button("Gotowe") {
                if nameField.isEmpty {
                    viewModel.place?.name = "Nowe"
                } else {
                    viewModel.place?.name = nameField
                }
                viewModel.places.append(viewModel.place!)
                self.presentationMode.wrappedValue.dismiss()
            })
            .onAppear(perform: {
                nameField = viewModel.place?.name ?? "nazwa"
            })
        }
    }
}
struct AddNewPlaceView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewPlaceView(viewModel: MapViewModel())
    }
}
