//
//  ContentView.swift
//  interviewList
//
//  Created by Alejandro Prieto on 20.03.22.
//

import SwiftUI

struct ContentView: View {
  
  @StateObject var flightVM: FlightVM
  
  var body: some View {
    
    List{
        // Scrollable list
        
        // For each of the retrieved records generate a RecordView
        ForEach(Array(zip(1..., flightVM.results)), id: \.0){ index, item in
          
          let viewModel = RecordVM(model: item)
          RecordRowView(resultVM: viewModel)
            .background(( index  % 2 == 0) ? Color(red: 0.7, green: 0.8, blue: 0.9) : Color(.white))
            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
          
        }
      
    }.listStyle(PlainListStyle())
  }
}

struct ContentView_Previews: PreviewProvider {
  
  
  static var previews: some View {
    
    
    ContentView(flightVM: RecordVM.repoVMData1)
  }
}
