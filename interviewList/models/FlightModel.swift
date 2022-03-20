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
struct FlightModel: Codable {

    let links: Links
    var name: String
    var flightNumber: Int
    var dateUnix: Int
    var id: String


    enum CodingKeys: String, CodingKey {
        case links
        case flightNumber = "flight_number"
        case name
        case dateUnix = "date_unix"
        case id
    }
    
}


struct Links: Codable {
    let patch: Patch

    enum CodingKeys: String, CodingKey {
        case patch
    }
}

struct Patch: Codable {
    let small, large: String?
}



