//
//  ErrorVM.swift
//  interviewList
//
//  Created by Alejandro Prieto on 13.03.22.
//

import Foundation


class ErrorVM: ObservableObject {
    
    //Github records
    @Published var errorStr = ""
    

    // Call the api and filter the results by the specified param: lang
    func setErrorText(appError: AppError) {
        if appError.errorDescription.contains("code=-1009"){
            errorStr = "The internet connections appear to be offline"
        }else{
            errorStr = appError.errorDescription
        }
    }
    
}
