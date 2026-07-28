//
//  GitHubService.swift
//  GithubClient
//
//  Created by Usuario invitado on 14/7/26.
//

import Foundation
import Alamofire

class GithubService {
    static let shared = GithubService()
    private let baseUrl = AppConfig.apiBaseURL
    private let apiToken = AppConfig.apiToken
    
    private init(){}
    
    private var headers: HTTPHeaders {
        [
            "Authorization": "Bearer \(apiToken)"
        ]
    }
    
    func getRepositories() async throws -> [Repository]{
        return try await AF.request(
            "\(baseUrl)/user/repos",
            method: .get,
            parameters: [
                "sort": "created",
                "direction": "desc",
                "per_page": 100,
                "affiliation": "owner",
                "t": NSDate().timeIntervalSince1970
            ],
            headers: headers
        )
        .validate(statusCode: 200..<300)
        .serializingDecodable([Repository].self)
        .value
    }
    func createRepository(name: String, desc: String) async throws -> Repository{
        let response = await AF.request(
            "\(baseUrl)/user/repos",
            method: .post,
            parameters: [
                "name": name,
                "description": desc,
            ],
            encoding: JSONEncoding.default,
            headers: headers,
        ).validate()
            .serializingDecodable(Repository.self)
            .response
            
            if let data = response.data,
               let json = String(data: data, encoding: .utf8){
                print("Response Body: ")
                print (json)
            }
        switch response.result{
        case.success(let repo):
            return repo
        case.failure(let error):
            print("=== Alamofire Error ===")
            print(error)
            throw error
        }
    }
    func getUserProfile() async throws -> UserInfo {
        return try await AF.request(
            "\(baseUrl)/user",
            method: .get,
            headers: headers
        )
        .validate(statusCode: 200..<300)
        .serializingDecodable(UserInfo.self)
        .value
    }
    
}


