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

    var id: String
    var name: String
    var flight_number: Int
    //var logoUrl: String?
    var date_unix: Double
    
    public init( id: String,
                 name: String,
                 flight_number: Int,
                 //logoUrl: String?,
                 date_unix: Double
                ) {
        
        self.id = id
        self.name = name
        self.flight_number = flight_number
        //self.logoUrl = logoUrl
        self.date_unix = date_unix
        
    }
}
