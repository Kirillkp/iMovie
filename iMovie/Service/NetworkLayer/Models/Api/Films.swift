import Foundation

struct Films: Codable {
    
    /// Общее кол-во фильмов
    let total: Int
    
    /// Общее кол-во страниц
    let totalPages: Int
    
    /// Фильмы
    let items: [Film]
}
