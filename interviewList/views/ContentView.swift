//
//  ContentView.swift
//  interviewList
//
//  Created by Alejandro Prieto on 20.03.22.
//

import SwiftUI

struct ContentView: View {
    
    let repoVM: RepoVM
    
    var body: some View {
        
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
}

struct ContentView_Previews: PreviewProvider {
    

    static var previews: some View {

        
        ContentView(repoVM: RecordVM.repoVMData1)
    }
}
