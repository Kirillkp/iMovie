import Foundation

struct Film: Codable, Equatable {
    
    static func == (lhs: Film, rhs: Film) -> Bool {
        return lhs.kinopoiskId == rhs.kinopoiskId
    }
    
    /// id фильма кинопоиска
    let kinopoiskId: Int

    /// id фильма IMDB
    let imdbId: String?

    /// Название фильма на русском
    let nameRu: String?

    /// Название фильма на eng
    let nameEn: String?

    /// Оригинальное название фильма
    let nameOriginal: String?

    /// URL на постер
    let posterUrl: String?

    /// URL на превью постера
    let posterUrlPreview: String?

    let coverUrl: String?

    /// URL на логотип
    let logoUrl: String?

    /// Количество отзывов
    let reviewsCount: Int?

    /// Рейтинг хороших отзывов
    let ratingGoodReview: Double?

    /// Количество хороших отзывов
    let ratingGoodReviewVoteCount: Int?

    /// Рейтинг кинопоиска
    let ratingKinopoisk: Double?

    /// Количество отзывов кинопоиска
    let ratingKinopoiskVoteCount: Int?

    /// Рейтинг IMDB
    let ratingImdb: Double?

    /// Количество отзывов IMDB
    let ratingImdbVoteCount: Int?

    /// Рейтинг кинокритиков
    let ratingFilmCritics: Double?

    /// Количество отзывов кинокритиков
    let ratingFilmCriticsVoteCount: Int?

    /// Рейтинг ожидания
    let ratingAwait: Double?

    /// Количество ожидания
    let ratingAwaitCount: Int?

    /// Рейтинговая критика
    let ratingRfCritics: Double?

    /// Количество рейтинговой критики
    let ratingRfCriticsVoteCount: Int?

    /// Ссылка на kinopoisk
    let webUrl: String?

    /// Год выпуска
    let year: Int?

    /// Длина кинофильма
    let filmLength: Int?

    /// Слоган
    let slogan: String?

    /// Описание
    let description: String?

    /// Короткое описание
    let shortDescription: String?

    /// Аннотация редактора
    let editorAnnotation: String?

    /// Доступны ли билеты
    let isTicketsAvailable: Bool?

    /// Производственный статус
    let productionStatus: String?

    /// Тип
    let type: String?

    /// Рейтинг MPAA
    let ratingMpaa: String?

    /// Возрастные ограничения просмотра
    let ratingAgeLimits: String?

    /// Есть в IMAX?
    let hasImax: Bool?

    /// Есть в 3D?
    let has3D: Bool?

    /// Последняя синхронизация
    let lastSync: String?

    /// Страны
    let countries: [Country]?

    /// Жанры
    let genres: [Genre]?

    /// Начало создания
    let startYear: Int?

    /// Конец создания
    let endYear: Int?

    /// Сериал?
    let serial: Bool?

    /// Короткий фильм?
    let shortFilm: Bool?

    /// Выполнен?
    let completed: Bool?
}
