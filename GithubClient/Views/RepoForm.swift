import SwiftUI

struct RepoForm: View {
    @State private var repoName: String = ""
    @State private var repoDescription: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                
                Spacer()
                TextField(
                    "",
                    text: $repoName,
                    prompt: Text("Nombre del repositorio")
                        .foregroundStyle(.black.opacity(0.4))
                )
                .textFieldStyle(.roundedBorder)
                .padding(.all)
                
                
                TextField(
                    "",
                    text: $repoDescription,
                    prompt: Text("Descripción del repositorio")
                        .foregroundStyle(.black.opacity(0.4))
                )
                .textFieldStyle(.roundedBorder)
                .padding(.all)
                
                Spacer()
                
                HStack {
                    
                    Button(action: {
                        print("Boton presionado")
                    }){
                        Label("Cancelar",
                              systemImage: "xmark.circle")
                            .padding(.all, 4)
                            .foregroundStyle(.red)
                    }
                    .buttonStyle(.bordered)
                    .padding(.horizontal, 4)
                    
                    Button(action: {
                        print("Boton presionado")
                    }){
                        Label("Guardar", systemImage: "square.and.arrow.down")
                            .padding(.all, 4)
                    }
                    .buttonStyle(.borderedProminent)
                    .padding(.horizontal, 4)
                }
                .padding()
                .navigationTitle("Formulario de repositorios")
                .navigationBarTitleDisplayMode(.inline)
            }
            }
        }
    }

#Preview {
    RepoForm()
}
