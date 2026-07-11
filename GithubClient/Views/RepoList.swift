import SwiftUI

struct RepoList: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    RepoItem()
                    RepoItem()
                    RepoItem()
                    RepoItem()
                    RepoItem()
                    RepoItem()
                    RepoItem()
                    RepoItem()
                    RepoItem()
                }
            }
            .navigationTitle("Repositorios")
            
        }
    }
}

#Preview {
    RepoList()
}
