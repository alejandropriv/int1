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
struct ContentView: View {
    
    //Binding for the RepoViewModel
    @StateObject private var repoViewModel = RepoVM()
    
    //Switching between UI components
    @State private var isLoaded = false

    
    init(){
        // Change Title font characteristics
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "Georgia-Bold", size: 15)!]
    }
    
    var body: some View {
        if isLoaded {
            
            NavigationView {
                VStack {
                    
                    List {
                        // For each of the retrieved records generate a RecordView
                        ForEach(repoViewModel.results, id: \.id)
                        {
                            let viewModel = RecordVM(model: $0)
                            RecordRowView(resultVM: viewModel)
                        }
                        
                    }
                    .listStyle(.inset)
                    
                }
                .navigationBarTitle(Text("Microsoft Learning Repos").font(.subheadline), displayMode: .large)
            
            }.onAppear(perform: fetch)
        
        }else{
            WaitingView()
        }
            
    }
    
    private func fetch() {
        repoViewModel.performAPICall()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}
