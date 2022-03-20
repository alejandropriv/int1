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
    GeometryReader { g in

    HStack(alignment: .center) {
      
        VStack{
          
          Text(String(resultVM.flightNumber))
            .font(.system(size: 15.0))
            .lineLimit(1)
            
        }
        .frame(width: g.size.width*0.1, alignment: .center)
        
        VStack{
          Text(resultVM.name)
            .font(.system(size: 22.0, weight: .semibold))
            .lineLimit(1)
          //.frame(width: g.size.width / 3)
          
          Text(resultVM.localDate)
            .font(.system(size: 14.0))
            .lineLimit(1)
            .foregroundColor(.gray)
          
          
        }
        .frame(width: g.size.width*0.6, alignment: .center)
        
        
        VStack {
          AsyncImage(url: resultVM.imgUrl) { image in
            image.resizable()
          } placeholder: {
            Image(systemName: "camera.fill")
          }
          .frame(width: 60, height: 60)
          .cornerRadius(10)
          
        }.frame(width: g.size.width*0.3, alignment: .leading)
      }
      
      
      
    }.padding()
      .frame( minWidth: 250, idealWidth: .infinity, maxWidth: .infinity, minHeight:80, idealHeight: 80, maxHeight: 80, alignment: .center )
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
