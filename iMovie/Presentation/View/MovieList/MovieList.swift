import Foundation
import SwiftUI

struct MovieList: View {
    
    let films: [Film]
    
    var body: some View {
        ScrollView {
            VStack {
                reposList
                    .animation(.linear)
            }.padding(.horizontal)
        }
    }
    
    private var reposList: some View {
        ForEach(films, id: \.kinopoiskId) { film in
            NavigationLink(destination: DetailsView(viewModel: DetailViewModel(with: film.kinopoiskId)),
                           label: { CardView(image: film.posterUrlPreview ?? .placeholderPreview) })
        }
    }
}
