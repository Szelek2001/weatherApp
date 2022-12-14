import Foundation
import Combine

class DataService: DataServiceProtocol {
    func getData<T: Decodable>() async-> AnyPublisher<T, Error> {
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(
                type: T.self,
                decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    let url: URL
    init(url: URL) {
        self.url = url
    }
}
