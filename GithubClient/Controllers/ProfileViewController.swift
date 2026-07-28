//
//  ProfileViewController.swift
//  GithubClient
//
//  Created by Usuario invitado on 28/7/26.
//

import Foundation

@MainActor
class ProfileViewController: ObservableObject {
    @Published var userProfile: UserInfo?
    @Published var isLoading = false
    @Published var errorMsg: String?

    func fetchUserProfile() async {
        isLoading = true
        errorMsg = nil
        
        do {
            userProfile = try await GithubService.shared.getUserProfile()
        } catch {
            errorMsg = error.localizedDescription
            print("Error al obtener el perfil: \(error)")
        }
        
        isLoading = false
    }
}
