//
//  RepoListViewController.swift
//  GithubClient
//
//  Created by Usuario invitado on 14/7/26.
//

import Foundation

 @MainActor
class RepoListViewController: ObservableObject {
    @Published var repositories: [Repository] = []
    @Published var isLoading: Bool = false
    @Published var ErrorMsg: String?
    
    private let githubService: GithubService
    
    init(service: GithubService = .shared) {
        self.githubService = service
    }
    
    func loadRepositories() async {
        isLoading = true
        do {
            repositories = try await githubService.getRepositories()
        } catch {
            ErrorMsg = error.localizedDescription
        }
        isLoading = false
    }
}
