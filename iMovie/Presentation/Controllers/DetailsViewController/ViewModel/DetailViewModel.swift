import Foundation
import Combine

final class DetailViewModel: ObservableObject {
    
    @Published private(set) var state: State
    
    private var bag = Set<AnyCancellable>()
    
    private let input = PassthroughSubject<Event, Never>()
    private let serviceLayer = ServiceLayer.shared
    
    init(with id: Int) {
        state = .idle(id)
        
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
        .store(in: &bag)
    }
    
    func send(event: Event) {
        input.send(event)
    }
    
    private func reduce(_ state: State, _ event: Event) -> State {
        switch state {
        case .idle(let id):
            switch event {
            case .onAppear:
                return .loading(id)
            default:
                return state
            }
        case .loading(let id):
            switch event {
            case .onFailedToLoad:
                return .error(id)
            case .onLoaded(let movie):
                return .loaded(movie)
            default:
                return state
            }
        case .loaded:
            return state
        case .error(let id):
            switch event {
            case .onReload:
                return .loading(id)
            default:
                return state
            }
        }
    }
    
    private func whenLoading() -> Feedback<State, Event> {
        Feedback { [weak self] (state: State) -> AnyPublisher<Event, Never> in
            guard case .loading(let id) = state else { return Empty().eraseToAnyPublisher() }

            return self?.serviceLayer.filmsService.obtainFilmId(with: "\(id)")
                .map(Event.onLoaded)
                .catch { _ in Just(Event.onFailedToLoad) }
                .eraseToAnyPublisher() ?? Empty().eraseToAnyPublisher()
        }
    }
    
    private func userInput(input: AnyPublisher<Event, Never>) -> Feedback<State, Event> {
        Feedback(run: { _ in
            return input
        })
    }
    
}

extension DetailViewModel {
    
    enum State {
        case idle(Int)
        case loading(Int)
        case loaded(Film)
        case error(Int)
    }
    
    enum Event {
        case onAppear
        case onLoaded(Film)
        case onFailedToLoad
        case onReload
    }
}
