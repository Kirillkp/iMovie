import Foundation
import Combine
import Alamofire

class ServiceProvider<T: URLRequestBuilder> {
    
    func request<U: Codable>(service: T, decodeType: U.Type) -> AnyPublisher<U, AFError> {
        return AF.request(service.urlRequest!)
            .validate()
            .publishDecodable(type: decodeType.self)
            .value()
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
}
