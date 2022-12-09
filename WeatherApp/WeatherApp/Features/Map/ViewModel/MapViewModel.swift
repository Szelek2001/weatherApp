import Foundation
import MapKit

class MapViewModel: ObservableObject {
    @Published var places = [Place]() {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(places) {
                        UserDefaults.standard.set(encoded, forKey: "Places")
            }
        }
    }
    init() {

        if let places = UserDefaults.standard.data(forKey: "Places") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([Place].self, from: places) {
                self.places = decoded
                return
            }
        }

        self.places = []
    }
    var place: Place?
}
