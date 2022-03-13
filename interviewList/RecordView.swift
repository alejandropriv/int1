//
//  RecordView.swift
//  interviewList
//
//  Created by Alejandro Prieto on 13.03.22.
//

import SwiftUI

struct SearchResultRow: View {
    
    let resultVM: SearchResultVM
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text(resultVM.name)
                .font(.title)
                .lineLimit(1)
            
            Text(resultVM.description)
                .font(.title2)
                .lineLimit(2)

            
            HStack {
                Text(resultVM.createdAt)
                    .font(.caption2)
                Spacer()

                Text(resultVM.stargazers_count)
                    .font(.caption2.weight(.light))
                
                Image(systemName: "star.fill")
                    .foregroundColor(Color.yellow)
                    .background()
                
                .frame(width: 50, height: 50)
                .cornerRadius(10)
            }


                
        }.padding()
        .frame( height: 120)
    }
}

struct SearchResultRow_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultRow(resultVM: SearchResultVM(
            model: RepoModel.example)
        )
        .previewLayout(.fixed(width: 360, height: 120))
    }
}
