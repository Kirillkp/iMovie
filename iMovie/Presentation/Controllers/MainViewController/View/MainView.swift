import SwiftUI
import Combine

struct MainView: View {
    
    @ObservedObject var viewModel = MainViewModel()
    
    private let input = PassthroughSubject<MainViewModel.Event, Never>()
    
    var body: some View {
        NavigationView {
            content
                .navigationTitle(String.commonTitleMainView)
        }.onAppear {
            viewModel.send(event: .onAppear)
        }
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
        case .loaded(let movies):
            return MovieList(films: movies).eraseToAnyView()
        case .empty:
            return PlaceholderView(state: .empty, buttonAction: {
                viewModel.send(event: .onReload)
            }).eraseToAnyView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
