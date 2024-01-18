import SwiftUI

struct StoryListRow: View {
    let story: StoryModel
    let onTap: () -> Void
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(story.title)
                .title2TextStyle()
                .padding(.bottom)
            Text(story.description)
                .foregroundStyle(.kOnSurfaceVariant)
                .padding(.bottom)
            Button {
                onTap()
            } label: {
                Text("PLAY")
                    .foregroundStyle(.kOnPrimary)
                    .padding(.vertical)
                    .frame(maxWidth: .infinity, alignment: .center)
            }
            .buttonStyle(.borderedProminent)
            .foregroundStyle(.kOnPrimary)
            .fontWeight(.semibold)
            .tint(.kPrimary)
        }
        .padding(12)
    }
}

#Preview {
    StoryListRow(story: StoryModel.example) {
        
    }
}
