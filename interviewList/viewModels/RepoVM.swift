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
    
    @Published var results = [RepoModel]()
    
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
                
                //Asynchronous call to avoid blocking the UI
                DispatchQueue.main.async { [weak self] in

                    self?.results = response.filter { rec in
                        return rec.language == self?.requestedLang
                    }
                    

                }
            } catch {
                print("Error info: \(error)")
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