import Foundation
import Combine

class MockHourlyService: DataServiceProtocol {

    
    var testData: ThreeHoursData?

    func loadJson() {
        if let url = Bundle.main.url(
            forResource: "threeHoursWeatherForecast", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(ThreeHoursData.self, from: data)
                testData = jsonData
            } catch let jsonError as NSError {
                print("JSON decode failed: \(jsonError)") }
        }
    }
    // swiftlint:disable force_cast
    func getData<T>() -> AnyPublisher<T, Error> where T : Decodable {
        loadJson()
        return Just(testData!)
            .tryMap({$0 as! T})
            .eraseToAnyPublisher()
    }
}
