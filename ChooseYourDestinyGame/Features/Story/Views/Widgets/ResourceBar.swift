import SwiftUI

struct ResourceBar: View {
    let resources: [ResourceModel]
    let playerResources: [String: Int]
    
    var body: some View {
        HStack(spacing: 24) {
            ForEach(resources, id: \.name) { resource in
                VStack {
                    Image(systemName: resource.icon)
                        .imageScale(.large)
                    Text("\(playerResources[resource.name] ?? 1)")
                }
                .foregroundStyle(.kOnSurface)
            }
        }
        .padding(.vertical, 16)
        .padding(.horizontal, 32)
        .background(.kSurfaceVariant)
        .clipShape(.rect(cornerRadius: 8))
    }
}

#Preview {
    ResourceBar(
        resources: [ResourceModel.example, ResourceModel.example2],
        playerResources: ["Health": 1, "Eco-Friendliness": 2]
    )
}
