//
//  RepoItem.swift
//  GithubClient
//
//  Created by Usuario invitado on 7/7/26.
//

import SwiftUI

struct RepoItem: View {
    let repository: Repository
    var body: some View {
        HStack {
            AsyncImage(url: URL(string:
                                    repository.owner.avatarUrl)!) { image in image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                Image(uiImage: .githubLogo)
                    .resizable()
                    .scaledToFill()
            }
            .frame(width: 80, height: 80)
            
            
            Spacer()
            VStack (alignment: .leading){
                Text(repository.name)
                    .font(.title2)
                
                if let description = repository.description {
                    Text(description)
                        .font(.caption)
                }
                
           
                if let language = repository.language{
                    HStack {
                        Text("Lenguaje:")
                            .font(.caption)
                        Spacer()
                        Text(language)
                            .font(.caption)
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    RepoItem(
        repository: Repository (
            id: 1,
            name: "Repositorio de prueba",
            description: "Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto.",
            language: "Swift",
            owner: UserInfo(
                login: "SCabreraML",
                name: "Sebastián Cabrera",
                avatarUrl: "https://avatars.githubusercontent.com/u/191403505?v=4",
                bio: "Esta es una Bio de prueba"
            )
        )
    )
}
