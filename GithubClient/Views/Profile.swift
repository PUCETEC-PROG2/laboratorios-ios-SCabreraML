//
//  Profile.swift
//  GithubClient
//
//  Created by Usuario invitado on 7/7/26.
//

import SwiftUI

struct Profile: View {
    var body: some View {
        NavigationStack {
            VStack (alignment: .leading) {
                Text("Sebastián Cabrera")
                    .font(.title)
                
                Image(uiImage: .githubLogo)
                    .resizable()
                    .scaledToFit()
                    
                
                Text("SCabreraML")
                    .font(.headline)
                    .padding(.vertical)
                
                Text("Desarrollo de Software")
            }
            .navigationTitle("Perfil")
            .padding()
        }
    }
}

#Preview {
    Profile()
}
