import SwiftUI

struct RepoForm: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Formulario de repositorios")
            }
            .navigationTitle("Formulario de repositorios")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    RepoForm()
}
