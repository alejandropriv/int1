//
//  ErrorUIView.swift
//  interviewList
//
//  Created by Alejandro Prieto on 13.03.22.
//

import SwiftUI

struct ErrorUIView: View {
    
    let errorDescription:String
    var body: some View {
        Text(errorDescription)
    }
}

struct ErrorUIView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorUIView(errorDescription: "This is a generic error")
    }
}
