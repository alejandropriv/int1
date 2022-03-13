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
    @StateObject private var repoVM = RepoVM()

    
    
    init(){
        // Change Title font characteristics
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "Georgia-Bold", size: 15)!]
    }
    
    var body: some View {
        Text("Microsoft Learning Repos").frame(maxWidth: .infinity, alignment: .topLeading)
            .font(.system(size: 20, weight: .heavy))
        

        NavigationView {
            
            if repoVM.onError.error == true{

                ErrorUIView(error: repoVM.onError)
            }


            else if repoVM.isLoaded == true {

                VStack {
                        
                    // Scrollable list
                    ScrollView {
                            // For each of the retrieved records generate a RecordView
                            ForEach(repoVM.results, id: \.id)
                            {
                                let viewModel = RecordVM(model: $0)
                                RecordRowView(resultVM: viewModel)
                            }
                            
                        }
                    }
                }
                else{
                    WaitingView()
                }
            
            }.onAppear(perform: fetch).navigationBarTitle(Text("Miacrosoft Learning Repos"))
            
            
    }
    
    private func fetch() {
        repoVM.performAPICall()
    }
}                                           

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}
