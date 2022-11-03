import Foundation

extension String {
    
    //MARK: Global
    
    /// Image placeholder
    static let placeholderPreview = NSLocalizedString("global_placeholder_poster_preview", bundle: .main, comment: "image_placeholder")
    
    /// Неизвестный
    static let globalUnknow = NSLocalizedString("global_unknow", bundle: .main, comment: "Неизвестный")
    
    /// Empty
    static let empty = NSLocalizedString("global_empty", bundle: .main, comment: "")
    
    //MARK: MainView
    
    ///iMovie
    static let commonTitleMainView = NSLocalizedString("common_title_main_view", bundle: .main, comment: "iMovie")
    
    //MARK: CardDetailView
    
    ///Жанры:
    static let commonGenreCardDetail = NSLocalizedString("common_genre_card_detail", bundle: .main, comment: "Жанры:")
    
    //MARK: PlaceholderView
    
    ///Ошибка
    static let commonPlaceholderStateError = NSLocalizedString("common_placeholder_state_error", bundle: .main, comment: "Ошибка.\nПерезагрузить")
    
    ///Загрузка
    static let commonPlaceholderStateLoading = NSLocalizedString("common_placeholder_state_loading", bundle: .main, comment: "Загрузка")
    
    ///Нет данных
    static let commonPlaceholderStateEmpty = NSLocalizedString("common_placeholder_state_empty", bundle: .main, comment: "Нет данных.\nПерезагрузить")
    
    ///Неизвестная ошибка
    static let commonPlaceholderStateNone = NSLocalizedString("common_placeholder_state_none", bundle: .main, comment: "Неизвестная ошибка")
}
