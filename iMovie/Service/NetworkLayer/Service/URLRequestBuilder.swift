import Foundation
import Alamofire

protocol URLRequestBuilder: URLRequestConvertible {
    var baseURL: String { get }
    var path: String { get }
    var headers: HTTPHeaders? { get }
    var parameters: Parameters? { get }
    var method: HTTPMethod { get }
}

extension URLRequestBuilder {
    
    var baseURL: String {
        "https://kinopoiskapiunofficial.tech/api"
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try baseURL.asURL()
        
        var request = URLRequest(url: url.appendingPathComponent(path))
        request.httpMethod = method.rawValue
        request.setValue("0920357d-9bfa-4380-8b22-a1e33542dab5", forHTTPHeaderField: "X-API-KEY")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        switch method {
        case .get:
            request.allHTTPHeaderFields = headers?.dictionary
            request = try URLEncoding.default.encode(request, with: parameters)
        default:
            break
        }
        
        return request
    }
}
