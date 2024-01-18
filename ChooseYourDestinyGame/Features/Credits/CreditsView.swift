import SwiftUI

struct CreditsView: View {
    var body: some View {
        ZStack {
            Color.kSurface.ignoresSafeArea()
            
            VStack {
                Spacer().frame(height: 36)
                
                VStack(spacing: 24) {
                    CreditsRow(title: "Game Designer", subtitle: "Burak Can Kurtarır")
                    CreditsRow(title: "Game Developer", subtitle: "Paul Hudson")
                    CreditsRow(title: "Game Artist", subtitle: "Karin Prater")
                    CreditsRow(title: "Special Thanks To", subtitle: "People who support me")
                }
                
                Spacer()
                
                HStack {
                    Image("street_lamp")
                    Spacer()
                    Image("street_lamp")
                }
                .padding(.horizontal, 40)
            }
            .ignoresSafeArea(edges: .bottom)
        }
        .navigationTitle("Credits")
        .navigationBarTitleDisplayMode(.large)

    }
}

#Preview {
    NavigationStack {
        CreditsView()
    }
}
