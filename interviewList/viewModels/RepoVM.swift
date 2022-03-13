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
class RepoVM: ObservableObject {
    
    //Github records
    @Published var results = [RepoModel]()
    
    // The records has been loaded
    @Published var isLoaded = false
    
    // an error has occurred
    @Published var onError = AppError()
    
    // isLoaded and onError could be summarized on a ENUM


    
    let requestedLang = "C#"

    // Call the api and filter the results by the specified param: lang
    func performAPICall() {
        
        let apiUrl = "https://api.github.com/users/MicrosoftLearning/repos"
        
        guard let gUrl = URL(
            string: apiUrl
        ) else { return }
        
        Task {
            do {
                let (data, _) = try await URLSession.shared.data(from: gUrl)
                let response = try JSONDecoder()
                    .decode([RepoModel].self, from: data)
                
                //Asynchronous call to avoid blocking the UI, and being able to update the view
                DispatchQueue.main.async { [weak self] in

                    let ghRecords = response.filter { rec in
                        return rec.language == self?.requestedLang
                    }
                    self?.results = ghRecords.sorted {
                        $0.stargazers_count < $1.stargazers_count
                    }
                    self?.isLoaded = true
                    

                }
            } catch {
                print("Error info: \(error)")
                DispatchQueue.main.async { [weak self] in
                    self?.onError = AppError(error: true, errorDescription: "\(error)")
                }
            }
        }
    }
    
    
}


struct RecordVM {
    
    let model: RepoModel
    
    var name: String {
        model.name
    }
    
    var description: String {
        model.description ?? ""
    }
    
    var createdAt: String {

        let isoDate = model.created_at
            //
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        //dateFormatter.dateFormat = "yyyy-MM-dd"
        let formatter3 = DateFormatter()
        formatter3.dateFormat = "HH:mm E, d MMM y"
        let dateStr = formatter3.string(from: dateFormatter.date(from:isoDate)!)

        
        return dateStr

        
    }
    
    var stargazers_count: String {
        return String(model.stargazers_count)
    }
    
    var language: String{
        model.language ?? ""
    }

}
