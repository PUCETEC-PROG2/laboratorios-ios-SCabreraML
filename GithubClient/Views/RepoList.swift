import SwiftUI

struct RepoList: View {
    var body: some View {
        NavigationStack {
            VStack {
                RepoItem()
                RepoItem()
                RepoItem()
                RepoItem()
                RepoItem()
            }
            .navigationTitle("Repositorios")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    RepoList()
}
