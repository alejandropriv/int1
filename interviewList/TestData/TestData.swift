//
//  TestData.swift
//  interviewList
//
//  Created by Alejandro Prieto on 20.03.22.
//

#if DEBUG

extension RepoModel {
    
    // this var is used for SwiftUI previewing
    static var repoModelData1: RepoModel {

        RepoModel(
            
            id: 123456,
            name: "20483-Programming-in-C-Sharp",
            description: "desc \n desc1",
            language: "C#",
            stargazers_count: 1000,
            created_at: "2018-01-11T09:40:34Z"

        )
    }
}

#endif


#if DEBUG

extension RecordVM {
    
    // this var is used for SwiftUI previewing
    static var repoVMData1: RepoVM {
        
        let repoVM = RepoVM()
        repoVM.results = [RepoModel.repoModelData1, RepoModel.repoModelData1, RepoModel.repoModelData1]
        return repoVM
    
    }
}

#endif
