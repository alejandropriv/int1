//
//  ErrorUIView.swift
//  interviewList
//
//  Created by Alejandro Prieto on 13.03.22.
//

import SwiftUI

struct ErrorUIView: View {
    
    let error:AppError
    var body: some View {
        Text(error.errorPretty)
    }
}

struct ErrorUIView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorUIView(error: AppError(error: true, errorDescription: "This is a generic error"))
    }
}
