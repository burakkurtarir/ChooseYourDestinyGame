import SwiftUI

struct LocalStoryListRow: View {
    let storyHistory: StoryHistoryDTO
    let onTap: () -> Void
    
    var story: StoryModel {
        storyHistory.story.toModel()
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(story.title)
                .title2TextStyle()
                .padding(.bottom, 2)
            Text(storyHistory.updatedAt, format: .dateTime)
                .font(.subheadline)
                .foregroundStyle(.kOnSurfaceVariant)
                .padding(.bottom)
            Text("Game state: \(storyHistory.gameState.textValue)")
                .foregroundStyle(.kOnSurfaceVariant)
                .padding(.bottom)
            Button {
                onTap()
            } label: {
                Text("CONTINUE")
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

//#Preview {
//    LocalStoryListRow(storyHistory: StoryHistoryModel.examle) {
//
//    }
//}
