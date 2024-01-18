import SwiftUI

struct Title2TextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title2)
            .fontWeight(.bold)
            .foregroundStyle(.kOnSurface)
    }
}

extension View {
    func title2TextStyle() -> some View {
        self.modifier(Title2TextModifier())
    }
}
