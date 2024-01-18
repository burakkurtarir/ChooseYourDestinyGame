import SwiftUI

struct ScenarioCard: View {
    let scenario: ScenarioModel
    let onTap: (_ choice: ChoiceModel) -> Void
    
    var body: some View {
        VStack {
            Text(scenario.text)
                .foregroundStyle(.kOnSurface)
                .padding(.bottom)
                .animation(.easeInOut, value: scenario)
            
            Image("scary_background")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity)
                .padding(.bottom)
                .animation(.easeInOut, value: scenario)
            
            VStack {
                ForEach(scenario.choices, id: \.self) { choice in
                    Button {
                        onTap(choice)
                    } label: {
                        HStack {
                            Text(choice.description)
                                .foregroundStyle(.kOnSurface)
                                .multilineTextAlignment(.leading)
                            
                            Spacer()
                            
                            VStack(alignment: .leading) {
                                ForEach(choice.resources, id: \.self) { resource in
                                    HStack {
                                        Image(systemName: resource.icon)
                                            .imageScale(.small)
                                            .foregroundStyle(.kOnSurface)
                                        Text("\(resource.change > 0 ? "+\(resource.change)" : "\(resource.change)")")
                                            .foregroundStyle(resource.change > 0 ? Color.kSuccess : Color.kError)
                                    }
                                }
                            }
                        }
                        .padding(10)
                        .overlay {
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.kOnSurface)
                        }
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    ScenarioCard(scenario: ScenarioModel.example) { choice in
        
    }
}
