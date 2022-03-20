//
//  WaitingView.swift
//  interviewList
//
//  Created by Alejandro Prieto on 13.03.22.
//

import SwiftUI



// A view letting you adjust the progress with tap gestures
struct WaitingView: View {
    @State private var progress = 0.2

    var body: some View {
        Circle()
            .trim(from: 0.0, to: 0.6)
            .stroke(.blue, lineWidth: 5.0)
            .frame(width: 120, height: 120)
            .rotationEffect(Angle(degrees: progress))
            .onAppear(perform: {self.start()})
    }
    
    func start() {
        _ = Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { timer in
            withAnimation {
                self.progress += 10.0
            }
            if self.progress == 360.0 {
                self.progress = 0.0
            }
        }
    }
}


struct WaitingView_Previews: PreviewProvider {
    static var previews: some View {
        WaitingView()
    }
}

