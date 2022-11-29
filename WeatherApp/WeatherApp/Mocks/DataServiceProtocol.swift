import Foundation
import Combine

protocol DataServiceProtocol {
   // func getData() -> AnyPublisher<CurrentData, Error>
    func getData<T: Decodable>() -> AnyPublisher<T, Error>
}
