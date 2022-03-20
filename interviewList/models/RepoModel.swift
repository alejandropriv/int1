//
//  RepoModel.swift
//  interviewList
//
//  Created by Alejandro Prieto on 13.03.22.
//

import Foundation

/**
 Repo Model Used to get data from JSON
 created_at defined as string to comply with the json, then in the modelview is formatted accordingly
 **/
struct RepoModel: Codable {

    var id: Int
    var name: String
    var description: String?
    var language: String?
    var created_at: String
    var stargazers_count: Int

    
    public init(id: Int,
                name: String,
                description: String?,
                language: String?,
                stargazers_count: Int,
                created_at: String
                ) {
        
        self.id = id
        self.name = name
        self.description = description
        self.language = language
        self.stargazers_count = stargazers_count
        self.created_at = created_at
        
    }
}
