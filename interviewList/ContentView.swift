//
//  ContentView.swift
//  interviewList
//
//  Created by Alejandro Prieto on 13.03.22.
//

import SwiftUI



struct ContentView: View {
    
    @StateObject private var viewModel = RepoViewModel()
    
    init(){
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "Georgia-Bold", size: 15)!]
    }
        
        var body: some View {
            NavigationView {
                VStack {
             
                    List {
                        HStack {
                            TextField("Search text", text: $viewModel.searchText)
                                .textFieldStyle(.roundedBorder)
                            if viewModel.isSearchEnabled {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.green)
                            } else {
                                Image(systemName: "x.circle.fill")
                                    .foregroundColor(.red)
                            }
                        }
                        .padding()
             
//                        ForEach(viewModel.results, id: \.trackId) {
//                            let viewModel = RepoViewModel(model: $0)
//                            //SearchResultRow(resultVM: viewModel)
//                        }
                    }
                    .listStyle(.inset)
                    
                    Button {
                        viewModel.performSearch()
                    } label: {
                        Text("SEARCH MUSIC")
                            .frame(width: 250, height: 40)
                    }
                    .buttonStyle(.bordered)
                    .disabled(!viewModel.isSearchEnabled)
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
