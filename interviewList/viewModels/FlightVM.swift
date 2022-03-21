//
//  Repo.swift
//  interviewList
//
//  Created by Alejandro Prieto on 13.03.22.
//

import Foundation

/**
 Repo View Model
 - Get and filter data from the github api
 - In a bigger app: networking code could be moved to an independent controller class
 */
class FlightVM: ObservableObject {
  
  //Github records
  @Published var results = [FlightModel]()
  
  // The records has been loaded
  @Published var appState = Constants.AppState.loading
  
  // an error has occurred
  @Published var onError = AppError()
  
  
  @Published var searchText: String = "" {
    didSet {
      isSearchEnabled = (searchText.count > 2)
      performAPICall()

      
    }
  }
  @Published var isSearchEnabled = false
  
  // isLoaded and onError could be summarized on a ENUM
  
  
  
  // Call the api and filter the results by the specified param: lang
  func performAPICall() {
    
    let apiUrl = "https://api.spacexdata.com/v5/launches/past"
    
    guard let gUrl = URL(
      string: apiUrl
    ) else { return }
    
    Task {
      do {
        let (data, _) = try await URLSession.shared.data(from: gUrl)
        let response = try JSONDecoder()
          .decode([FlightModel].self, from: data)
        
        //Asynchronous call to avoid blocking the UI, and being able to update the view
        DispatchQueue.main.async { [weak self] in
          
          var ghRecords = response
          if ((self?.isSearchEnabled) == true) {
            ghRecords = response.filter { rec in
              return rec.name.contains(self?.searchText ?? "")
            }
          }
          
          print (ghRecords)
          
          self?.results = ghRecords

          self?.appState = .success
          
        }
      } catch {
        print("Error info: \(error)")
        DispatchQueue.main.async { [weak self] in
          self?.onError = AppError(error: true, errorDescription: "\(error)")
          self?.appState = .failed
          
        }
      }
    }
  }
}


struct RecordVM {
  
  let model: FlightModel
  
  var id: String{
    model.id
  }
  
  var name: String {
    model.name
  }
  
  var flightNumber: Int{
    model.flightNumber
  }
  
  var localDate: String{
    
    // Create Date
    let date = Date()
    // Create Date Formatter
    let dateFormatter = DateFormatter()
    // Set Date Format
    dateFormatter.dateFormat = "YY, MMM d, hh:mm"
    // Convert Date to String
    
    let localDate = dateFormatter.string(from: date)
    
    
    return localDate
    
  }
  
  var imgUrl: URL? {
    URL(string: model.links.patch.small ?? "")
  }
  
  
  
  
  
  
  
  
}
