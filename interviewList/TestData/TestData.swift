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
        let patch = Patch(small: "https://images2.imgbox.com/3c/0e/T8iJcSN3_o.png", large: "")
        let links = Links(patch: patch)
        
        let flightModel = FlightModel(
            
            links: links,
            name: "FalconSat",
            flightNumber: 1,
            //logoUrl: "https://images2.imgbox.com/3c/0e/T8iJcSN3_o.png",
            dateUnix: 1143239400,
            id: "1"

        )
        return flightModel
    }
}

#endif


#if DEBUG

extension RecordVM {
    
    // this var is used for SwiftUI previewing
    static var repoVMData1: FlightVM {
        
        let flightVM = FlightVM()
        flightVM.results = [FlightModel.flightModelData1, FlightModel.flightModelData1, FlightModel.flightModelData1]
        return flightVM
    
    }
}

#endif
