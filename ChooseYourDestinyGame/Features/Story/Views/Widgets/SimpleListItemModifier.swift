import SwiftUI

struct SimpleListItemModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .listRowBackground(Color.kSurface)
            .listRowSeparator(.hidden)
            .listRowInsets(EdgeInsets(top: 10, leading: 8, bottom: 10, trailing: 8))
            .clipShape(.rect(cornerRadius: 8))
    }
}

extension View {
    func simpleListItemStyle() -> some View {
        self.modifier(SimpleListItemModifier())
    }
}
