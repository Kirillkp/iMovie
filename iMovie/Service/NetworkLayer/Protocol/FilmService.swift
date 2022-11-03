import Foundation
import Combine
import Alamofire

protocol FilmsService {
    
    /// Получить данные о фильме через id
    func obtainFilmId(with id: String) -> AnyPublisher<Film, AFError>
    
    /// Получить данные о фильме
    func obtainFilm(order: Order, type: TypeFilm) -> AnyPublisher<Films, AFError>
}
