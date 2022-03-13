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
             
                        ForEach(viewModel.results, id: \.trackId) {
                            let viewModel = SearchResultVM(model: $0)
                            SearchResultRow(resultVM: viewModel)
                        }
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


struct SearchResultRow: View {
    
    let resultVM: SearchResultVM
    
    var body: some View {
        HStack {
            
            AsyncImage(url: resultVM.imgUrl) { image in
            image.resizable()
            } placeholder: {
                Image(systemName: "camera.fill")
            }
            .frame(width: 50, height: 50)
            .cornerRadius(10)
                
            Text(resultVM.trackName)
                .font(.title3)
                .lineLimit(2)

            Spacer()
            
            VStack {
                Text("Price")
                    .font(.caption2)
                Text(resultVM.fullPrice)
                    .font(.caption2.weight(.heavy))
            }
                
        }.padding()
    }
}

struct SearchResultRow_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultRow(resultVM: SearchResultVM(
            model: RepoModel.example)
        )
            .previewLayout(.fixed(width: 360, height: 80))
    }
}
