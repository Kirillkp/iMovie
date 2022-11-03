import Alamofire

enum FilmsEndpoint: URLRequestBuilder {
    
    /// Получить данные о фильме через id
    case obtainFilmId(id: String)
    
    /// Получить данные о фильмaх
    case obtainFilm(order: Order,
                    type: TypeFilm)
    
    var path: String {
        switch self {
        case .obtainFilmId(let id):
            return "/v2.2/films/\(id)"
        case .obtainFilm:
            return "/v2.2/films"
        }
    }
    
    var headers: HTTPHeaders? {
        switch self {
        default:
            return nil
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case.obtainFilm(let order, let type):
            return ["order" : order.rawValue,
                    "type" : type.rawValue]
        default:
            return nil
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .obtainFilmId:
            return .get
        case .obtainFilm:
            return .get
        }
    }
}
