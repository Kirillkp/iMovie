import SwiftUI

struct DetailsView: View {
    
    @ObservedObject var viewModel: DetailViewModel
    
    var body: some View {
        content
            .onAppear { viewModel.send(event: .onAppear) }
    }
    
    private var content: some View {
        switch viewModel.state {
        case .idle:
            return PlaceholderView(state: .loading).eraseToAnyView()
        case .loading:
            return PlaceholderView(state: .loading).eraseToAnyView()
        case .error:
            return PlaceholderView(state: .error, buttonAction: {
                viewModel.send(event: .onReload)
            }).eraseToAnyView()
        case .loaded(let film):
            return CardDetailView(film: film).eraseToAnyView()
        }
    }
}
