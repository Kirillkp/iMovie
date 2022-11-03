import Foundation
import Combine

struct Feedback<State, Event> {
    let run: (AnyPublisher<State, Never>) -> AnyPublisher<Event, Never>
}

extension Feedback {
    init<Effect: Publisher>(effects: @escaping (State) -> Effect) where Effect.Output == Event, Effect.Failure == Never {
        self.run = { state -> AnyPublisher<Event, Never> in
            state
                .map { effects($0) }
                .switchToLatest()
                .eraseToAnyPublisher()
        }
    }
}

extension Publishers {
    
    static func system<State, Event, Scheduler: Combine.Scheduler>(
        initial: State,
        reduce: @escaping (State, Event) -> State,
        scheduler: Scheduler,
        feedbacks: [Feedback<State, Event>]
    ) -> AnyPublisher<State, Never> {
        
        let state = CurrentValueSubject<State, Never>(initial)
        
        let events = feedbacks.map { feedback in feedback.run(state.eraseToAnyPublisher()) }
        
        return Deferred {
            Publishers.MergeMany(events)
                .receive(on: scheduler)
                .scan(initial, reduce)
                .handleEvents(receiveOutput: state.send)
                .receive(on: scheduler)
                .prepend(initial)
                .eraseToAnyPublisher()
        }
        .eraseToAnyPublisher()
    }
}
