import Foundation
import Combine

protocol DataServiceProtocol {
    func getData<T: Decodable>() async -> AnyPublisher<T, Error>
}
