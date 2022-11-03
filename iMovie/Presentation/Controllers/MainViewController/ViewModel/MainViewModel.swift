import Foundation
import Combine

final class MainViewModel: ObservableObject {
    
    @Published private(set) var state = State.idle
    
    private var cancellableSet = Set<AnyCancellable>()
    private let input = PassthroughSubject<Event, Never>()
    private let serviceLayer = ServiceLayer.shared
     
    init() {
        Publishers.system(
            initial: state,
            reduce: reduce,
            scheduler: RunLoop.main,
            feedbacks: [
                whenLoading(),
                userInput(input: input.eraseToAnyPublisher())
            ]
        )
        .assign(to: \.state, on: self)
        .store(in: &cancellableSet)
    }
    
    deinit {
        cancellableSet.removeAll()
    }
    
    func send(event: Event) {
        input.send(event)
    }
    
    private func reduce(_ state: State, _ event: Event) -> State {
        switch state {
        case .idle:
            switch event {
            case .onAppear:
                return .loading
            default:
                return state
            }
        case .loading:
            switch event {
            case .onFailedToLoadMovies:
                return .error
            case .onMoviesLoaded(let movies):
                return .loaded(movies)
            case .onMoviesEmpty:
                return .empty
            default:
                return state
            }
        case .loaded:
            return state
        case .error:
            switch event {
            case .onReload:
                return .loading
            default:
                return state
            }
        case .empty:
            switch event {
            case .onReload:
                return .loading
            default:
                return state
            }
        }
    }
    
    private func whenLoading() -> Feedback<State, Event> {
        Feedback { (state: State) -> AnyPublisher<Event, Never> in
            guard case .loading = state else { return Empty().eraseToAnyPublisher() }
            
            return self.serviceLayer.filmsService.obtainFilm(order: .rating, type: .film)
                .map { films in
                    guard !films.items.isEmpty else { return Event.onMoviesEmpty }
                    return Event.onMoviesLoaded(films.items)
                }
                .catch { _ in Just(Event.onFailedToLoadMovies) }
                .eraseToAnyPublisher()
        }
    }
    
    private func userInput(input: AnyPublisher<Event, Never>) -> Feedback<State, Event> {
        Feedback { _ in input }
    }
}

extension MainViewModel {
    
    enum State {
        case idle
        case loading
        case loaded([Film])
        case error
        case empty
    }
    
    enum Event {
        case onAppear
        case onMoviesLoaded([Film])
        case onFailedToLoadMovies
        case onMoviesEmpty
        case onReload
     }
}
