import Foundation
import Alamofire

final class ServiceLayer {
    
    // MARK: Shared instance

    static let shared = ServiceLayer()

    // MARK: Service
    
    let filmsService: FilmsService
    
    private init() {
        
        let filmsProvider = ServiceProvider<FilmsEndpoint>()
        filmsService = FilmsServiceImpl(serviceProvider: filmsProvider)
    }
    
}
