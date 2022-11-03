import Foundation
import Combine
import Alamofire

final class FilmsServiceImpl: FilmsService {

    private let serviceProvider: ServiceProvider<FilmsEndpoint>

    init(serviceProvider: ServiceProvider<FilmsEndpoint>) {
        self.serviceProvider = serviceProvider
    }

    /// Получить данные о фильме через id
    func obtainFilmId(with id: String) -> AnyPublisher<Film, AFError> {
        serviceProvider.request(service: .obtainFilmId(id: id), decodeType: Film.self)
    }

    /// Получить данные о фильмах
    func obtainFilm(order: Order, type: TypeFilm) -> AnyPublisher<Films, AFError> {
        serviceProvider.request(service: .obtainFilm(order: order, type: type), decodeType: Films.self)
    }
}
