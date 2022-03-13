//
//  Repo.swift
//  interviewList
//
//  Created by Alejandro Prieto on 13.03.22.
//

import Foundation


class RepoViewModel: ObservableObject {
    
    @Published var results = [RepoModel]()
    @Published var searchText: String = "" {
        didSet { isSearchEnabled = (searchText.count > 2) }
    }
    @Published var isSearchEnabled = false

    func performSearch() {
        
        let search = searchText.addingPercentEncoding(
            withAllowedCharacters: .urlHostAllowed
        ) ?? ""
        
        guard let gUrl = URL(
            string: "https://itunes.apple.com/search?term=\(search)"
        ) else { return }
        
        Task {
            do {
                let (data, _) = try await URLSession.shared.data(from: gUrl)
                let response = try JSONDecoder()
                    .decode(SearchResponse.self, from: data)
                DispatchQueue.main.async { [weak self] in
                    self?.results = response.results ?? []
                }
            } catch {
                print("*** ERROR ***")
            }
        }
    }
}


struct SearchResultVM {
    
    let model: RepoModel
    
    var trackName: String {
        model.trackName ?? ""
    }
    
    var imgUrl: URL? {
        URL(string: model.artworkUrl60 ?? "")
    }
    
    var fullPrice: String {
        guard let gPrice = model.trackPrice,
                let gCurrency = model.currency else { return "NA"}
        return gPrice.formatted(.currency(code: gCurrency))
    }
}
