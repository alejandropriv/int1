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
            
            HStack {
//                Text(String("Fn: "))
//                    .font(.system(size: 20.0))
//                    .lineLimit(1)
//                    .opacity(0.6)
                
                Text(String(resultVM.flightNumber))
                    .font(.system(size: 20.0))
                    .lineLimit(1)
                
                Spacer()
                
                Text(resultVM.name)
                    .font(.system(size: 20.0))
                    .lineLimit(1)
                
                Spacer()
                
                Text(resultVM.name)
                    .font(.system(size: 20.0))
                    .lineLimit(1)
                
            }
            
            //Show description in 2 lines
//            Text(resultVM.description)
//                .fixedSize(horizontal: false, vertical: true)
//                .font(.system(size: 15.0))
//                .lineLimit(2)

            
            HStack {
                Text(resultVM.name)
                    .font(.caption2)

            }


                
        }.padding()
            .frame( minWidth: 250, idealWidth: .infinity, maxWidth: .infinity, minHeight:120, idealHeight: 120, maxHeight: 120, alignment: .center )
    }
}

struct SearchResultRow_Previews: PreviewProvider {
    static var previews: some View {
        RecordRowView(resultVM: RecordVM(
            model: FlightModel.flightModelData1)
        )
        .previewLayout(.fixed(width: 360, height: 120))
    }
}
