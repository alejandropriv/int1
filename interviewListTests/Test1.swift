//
//  Test1.swift
//  interviewListTests
//
//  Created by Alejandro Prieto on 21.03.22.
//

import XCTest


class Test1: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test1() throws {
      
      
      
      XCTAssertEqual(FlightModel.flightModelData1.name, "FalconSat")
      XCTAssertEqual(FlightModel.flightModelData1.flightNumber, 1)
      XCTAssertEqual(FlightModel.flightModelData1.links.patch.small, "https://images2.imgbox.com/3c/0e/T8iJcSN3_o.png")

    

      

    }

  func test2() throws {
        
    XCTAssertEqual(RecordVM.repoVMData1.isSearchEnabled, false)
    XCTAssertEqual(RecordVM.repoVMData1.results.count, 3)
    XCTAssertEqual(RecordVM.repoVMData1.appState, .loading)

  

    

  }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
