//
//  ContentView.swift
//  interviewList
//
//  Created by Alejandro Prieto on 13.03.22.
//

import SwiftUI



struct ContentView: View {
    
    @StateObject private var repoViewModel = RepoViewModel()
    
    init(){
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "Georgia-Bold", size: 15)!]
    }
        
        var body: some View {
            NavigationView {
                VStack {
             
                    List {
             
                        ForEach(repoViewModel.results, id: \.id)
                        {
                            let viewModel = SearchResultVM(model: $0)
                            SearchResultRow(resultVM: viewModel)
                            
                        }
                        
                    }
                    .listStyle(.inset)
                    
                    Button {
                        repoViewModel.performSearch()
                    } label: {
                        Text("SEARCH MUSIC")
                            .frame(width: 250, height: 40)
                    }
                    .buttonStyle(.bordered)
                    .padding(.bottom, 8)
                }
                .navigationBarTitle(Text("Microsoft Learning Repos").font(.subheadline), displayMode: .large)
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
.previewInterfaceOrientation(.portrait)
    }
}
