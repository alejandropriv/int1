//
//  Repo.swift
//  interviewList
//
//  Created by Alejandro Prieto on 13.03.22.
//

import Foundation


class RepoViewModel: ObservableObject {
    
    @Published var results = [RepoModel]()

    func performSearch() {
        
        let apiUrl = "https://api.github.com/users/MicrosoftLearning/repos"
        
        guard let gUrl = URL(
            string: apiUrl
        ) else { return }
        
        Task {
            do {
                let (data, _) = try await URLSession.shared.data(from: gUrl)
                let response = try JSONDecoder()
                    .decode([RepoModel].self, from: data)
                
                DispatchQueue.main.async { [weak self] in

                    self?.results = response
                }
            } catch {
                print("Error info: \(error)")
            }
        }
    }
    
    
}


struct SearchResultVM {
    
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

}
