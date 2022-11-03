import Foundation
import SwiftUI
import Liquid


struct PlaceholderView: View {
    
    var state: StatePlaceholder? = .loading
    
    var buttonAction: (() -> Void)?
    
    private var color: Color {
        switch state {
        case .error:
            return .red
        case .loading:
            return .blue
        case .empty:
            return .gray
        case .none:
            return .gray
        }
    }
    
    private var text: String {
        switch state {
        case .error:
            return .commonPlaceholderStateError
        case .loading:
            return .commonPlaceholderStateLoading
        case .empty:
            return .commonPlaceholderStateEmpty
        case .none:
            return .commonPlaceholderStateNone
        }
    }
    
    var body: some View {
        VStack {
            ZStack {
                Liquid(period: 1)
                    .frame(width: 260, height: 260)
                    .foregroundColor(color)
                    .opacity(0.3)

                Liquid(period: 2)
                    .frame(width: 240, height: 240)
                    .foregroundColor(color)
                    .opacity(0.6)

                Liquid(samples: 4)
                    .frame(width: 220, height: 220)
                    .foregroundColor(color)
                
                Text(text).font(.largeTitle)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
            }
        }.onTapGesture {
            if state == .error || state == .empty {
                buttonAction?()
            }
        }
        
    }
}

enum StatePlaceholder {
    case error
    case loading
    case empty
}

struct LoaderView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceholderView(state: .loading)
    }
}
