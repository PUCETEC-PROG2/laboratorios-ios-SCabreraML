import SwiftUI

struct RepoList: View {
    @StateObject private var viewController = RepoListViewController()

    var body: some View {
        NavigationStack {
            Group {
                if viewController.isLoading {
                    ProgressView("Cargando repositorios...")
                    
                } else if let errorMsg = viewController.ErrorMsg {
                    Text(errorMsg)
                        .foregroundStyle(.red)
                        .padding()
                    
                } else {
                    List(viewController.repositories) { repo in
                        RepoItem(repository: repo)
                    }
                }
            }
            .navigationTitle("Repositorios")
        }
        .task {
            await
                viewController
                    .loadRepositories()
        }
    }
}

#Preview {
    RepoList()
}
