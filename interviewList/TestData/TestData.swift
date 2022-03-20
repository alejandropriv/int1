//
//  TestData.swift
//  interviewList
//
//  Created by Alejandro Prieto on 20.03.22.
//

#if DEBUG

extension FlightModel {
    
    // this var is used for SwiftUI previewing
    static var flightModelData1: FlightModel {

        FlightModel(
            
            id: "1",
            name: "FalconSat",
            flight_number: 1,
            //logoUrl: "https://images2.imgbox.com/3c/0e/T8iJcSN3_o.png",
            date_unix: 1143239400

        )
    }
}

#endif


#if DEBUG

extension RecordVM {
    
    // this var is used for SwiftUI previewing
    static var repoVMData1: FlightVM {
        
        let repoVM = FlightVM()
        repoVM.results = [FlightModel.flightModelData1, FlightModel.flightModelData1, FlightModel.flightModelData1]
        return repoVM
    
    }
}

#endif
