import Foundation
import SwiftUI

extension View {
    
    func xCentered() -> some View {
        HStack {
            Spacer()
            self
            Spacer()
        }
    }
    
    func eraseToAnyView() -> AnyView {
        AnyView(self)
    }
}
