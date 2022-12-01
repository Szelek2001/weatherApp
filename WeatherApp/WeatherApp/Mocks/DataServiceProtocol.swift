import Foundation
import Combine

protocol DataServiceProtocol {
    func getData<T: Decodable>() -> AnyPublisher<T, Error>
}
