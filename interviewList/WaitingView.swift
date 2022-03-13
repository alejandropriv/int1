//
//  WaitingView.swift
//  interviewList
//
//  Created by Alejandro Prieto on 13.03.22.
//

import SwiftUI

// Waiting view, spinner to show progress
struct WaitingView: View {
    

    var body: some View {
        VStack {
            ProgressView()
               // and if you want to be explicit / future-proof...
               // .progressViewStyle(CircularProgressViewStyle())
        }.frame(width: .infinity, height: .infinity, alignment: .center)
    }
}


struct WaitingView_Previews: PreviewProvider {
    static var previews: some View {
        WaitingView()
    }
}

