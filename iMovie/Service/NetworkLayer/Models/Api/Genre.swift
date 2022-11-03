import Foundation

struct Genre: Codable, Equatable {
    
    static func == (lhs: Genre, rhs: Genre) -> Bool {
        return lhs.genre == rhs.genre
    }
    
    /// Жанр
    let genre: String
}
