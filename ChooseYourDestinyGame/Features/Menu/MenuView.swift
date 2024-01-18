import SwiftUI

struct MenuView: View {
    @Environment(\.navigationManager) private var navigationManager
    
    var body: some View {
        ZStack {
            Color.kSurface.ignoresSafeArea()
            
            VStack {
                Text("CHOOSE YOUR\nDESTINY").titleTextStyle()
                Image("crow")
                
                Spacer()
                
                VStack(spacing: 16) {
                    MenuButton(text: "NEW GAME") {
                        navigationManager.push(.stories)
                    }
                    MenuButton(text: "LOAD GAME") {
                        navigationManager.push(.localStories)
                    }
                    MenuButton(text: "CREDITS") {
                        navigationManager.push(.credits)
                    }
                }
                
                Spacer()
                
                Image("mountains")
                    .resizable()
                    .scaledToFit()
            }
            .ignoresSafeArea(edges: .bottom)
        }
    }
}



#Preview {
    MenuView()
}
