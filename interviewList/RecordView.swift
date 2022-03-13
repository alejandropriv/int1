//
//  RecordView.swift
//  interviewList
//
//  Created by Alejandro Prieto on 13.03.22.
//

import SwiftUI

/** Create a view for each record retrieved from the API
 */
struct RecordRowView: View {
    
    let resultVM: RecordVM
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text(resultVM.name)
                .font(.system(size: 20.0))
                .lineLimit(1)
            
            //Show description in 2 lines
            Text(resultVM.description)
                .fixedSize(horizontal: false, vertical: true)
                .font(.system(size: 15.0))
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
        RecordRowView(resultVM: RecordVM(
            model: RepoModel.example)
        )
        .previewLayout(.fixed(width: 360, height: 120))
    }
}
