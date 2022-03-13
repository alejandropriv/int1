//
//  RepoModel.swift
//  interviewList
//
//  Created by Alejandro Prieto on 13.03.22.
//

import Foundation

struct SearchResponse: Codable {
    let results: [RepoModel]?
}

// MARK: - Repo Model
struct RepoModel: Codable {

    var id: Int
    var name: String
    var description: String?
    var created_at: String
    var stargazers_count: Int

    
    public init(id: Int,
                name: String,
                description: String?,
                createdAt: String,
                stars: Int) {
        
        self.id = id
        self.name = name
        self.description = description
        self.stargazers_count = stars
        self.created_at = createdAt
        
    }
}



#if DEBUG
// MARK: - Repo Item
extension RepoModel {
    
    static var example: RepoModel {

        RepoModel(
            
            id: 123456,
            name: "20483-Programming-in-C-Sharp",
            description: "desc \n desc1",
            createdAt: "2018-01-11T09:40:34Z",
            stars: 1000
            
        )
    }
}

#endif
