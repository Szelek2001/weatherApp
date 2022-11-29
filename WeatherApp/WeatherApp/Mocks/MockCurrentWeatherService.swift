import Foundation
import Combine

class MockCurrentWeatherService: DataServiceProtocol {
    var testData: CurrentData?
    
    func loadJson() {
        if let url = Bundle.main.url(
            forResource: "currentWeatherData", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(CurrentData.self, from: data)
                testData = jsonData
            } catch let jsonError as NSError {
                print("JSON decode failed: \(jsonError)") }
        }
    }
    func getData() -> AnyPublisher<CurrentData, Error> {
        loadJson()
        return Just(testData!)
            .tryMap({$0})
            .eraseToAnyPublisher()
    }
}
