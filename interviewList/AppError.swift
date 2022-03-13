//
//  AppError.swift
//  interviewList
//
//  Created by Alejandro Prieto on 13.03.22.
//

import Foundation

struct AppError {
    var error = false
    var errorDescription = ""
    var errorPretty:String{
        var errorStr:String
        if errorDescription.contains("-1009"){
            errorStr = "The internet connections appear to be offline"
        }else{
            errorStr = errorDescription
        }
        return errorStr
    }
}
