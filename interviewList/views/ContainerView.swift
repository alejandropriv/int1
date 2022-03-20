//
//  ContentView.swift
//  interviewList
//
//  Created by Alejandro Prieto on 13.03.22.
//

import SwiftUI


/** Define the list
 hold the waiting and the error Views
 
 }*/
struct ContainerView: View {
  
  @State private var appError: AppError
  
  //Binding for the RepoViewModel
  @StateObject private var repoVM = FlightVM()
  
  
  
  var title = "SpaceX Launches"
  
  
  init(){
    // Change Title font characteristics
    UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "Georgia-Bold", size: 35)!]
    
    appError = AppError()
    
  }
  
  var body: some View {
    //        Text(title).frame(maxWidth: .infinity, alignment: .center)
    //            .font(.system(size: 35, weight: .heavy))
    //            .foregroundColor(.blue)
    
    
    
    NavigationView {
      
      Group{
        switch repoVM.appState{
        case .loading:
          WaitingView()
          
        case .success:
//          TextField(
//            "Hint Text",
//            text: "aaaaa"
//          ).padding()
          
          ContentView(flightVM: repoVM)
          
        case .failed:
          ErrorUIView(error: appError ) //"repoVM.onError"
        }
      }
      .navigationBarTitle("SpaceX Launches", displayMode: .inline)
      
      
    }
    .onAppear(perform:fetch)
    
  }
  
  
  
  private func fetch() {
    repoVM.performAPICall()
  }
}

struct ContainerView_Previews: PreviewProvider {
  
  static let appStates: [Constants.AppState] = [.loading, .success, .failed]
  
  static var previews: some View {
    Group {
      
      //            ForEach(appStates, id: \.self) { sizeCategory in
      ContainerView()
        .previewInterfaceOrientation(.portrait)
      
      //}
    }
    
    
  }
}
