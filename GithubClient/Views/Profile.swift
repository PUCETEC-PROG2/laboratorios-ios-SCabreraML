//
//  Profile.swift
//  GithubClient
//
//  Created by Usuario invitado on 7/7/26.
//

import SwiftUI

struct Profile: View {
    @StateObject private var viewController = ProfileViewController()
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                if viewController.isLoading {
                    ProgressView("Cargando perfil...")
                } else if let errorMsg = viewController.errorMsg {
                    Text(errorMsg)
                        .foregroundStyle(.red)
                } else if let user = viewController.userProfile {
                    Text(user.name ?? "Sin nombre")
                        .font(.title)
                    
                    AsyncImage(url: URL(string: user.avatarUrl)) { image in
                        image
                            .resizable()
                            .scaledToFit()
                    } placeholder: {
                        ProgressView()
                    }
                    
                    Text("@\(user.login)")
                        .font(.headline)
                        .padding(.vertical)
                    
                    Text(user.bio ?? "Sin biografía")
                }
            }
            .navigationTitle("Perfil")
            .padding()
            .task {
                await viewController.fetchUserProfile()
            }
        }
    }
}

#Preview {
    Profile()
}
