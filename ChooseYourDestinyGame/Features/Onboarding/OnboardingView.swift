import SwiftUI

struct OnboardingView: View {
    @Binding var showOnboarding: Bool
    @State private var selection = 0
    @State private var isLampShaking = true
    private let onboardingModels = OnboardingModel.models
    
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .top) {
                Color.kSurface.ignoresSafeArea()
                
                HStack {
                    Spacer()
                    Image("green_lamp")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 120)
                        .padding(.trailing, 32)
                        .rotationEffect(.degrees(isLampShaking ? -8 : 8), anchor: .top)
                        .animation(.easeOut(duration: 1.5).repeatForever(autoreverses: true), value: isLampShaking)
                        .onAppear {
                            // If we don't use DispatchQueue.main.async, animation looks different in the device. People say it's because of NavigationStack
                            DispatchQueue.main.async {
                                isLampShaking = false
                            }
                        }
                }
                .ignoresSafeArea()
                
                TabView(selection: $selection) {
                    ForEach(0..<onboardingModels.count, id: \.self) { index in
                        OnboardingItem(model: onboardingModels[index], isLast: index == onboardingModels.count - 1, onTap: goNext)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .toolbar(.hidden)
            }
        }
    }
    
    func goNext() {
        if selection < onboardingModels.count - 1 {
            withAnimation {
                selection += 1
            }
        } else {
            showOnboarding = false
        }
    }
}



#Preview {
    OnboardingView(showOnboarding: .constant(true))
}
