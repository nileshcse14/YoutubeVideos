//
//  ContentViewModel.swift
//  Coupling
//
//  Created by Nilesh on 15/12/22.
//

import Foundation

struct UserDisplay: Identifiable {
    var name: String?
    var id: Int?
}



class ContentViewModel: ObservableObject {
    
    private let userRepository : UserRepositoryDelegate
    
    init(userRepository: UserRepositoryDelegate = UserRepository()) {
        self.userRepository = userRepository
    }
    @Published var users = [UserDisplay]()
    
    func getJsonPlaceHolderData() {
        userRepository.getJsonPlaceHolderUsers { result in
            switch result {
            case .success(let success):
                self.createJsonUsers(responseArray: success)
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    func getData() {
        getGithubData()
    }
    
    private func createJsonUsers(responseArray: [ResponseElement]) {
        var localusers = [UserDisplay]()
        for item in responseArray {
            localusers.append(UserDisplay(name: item.name, id: item.id))
        }
        users = localusers
    }
    
    func getGithubData() {
        userRepository.getGithubUsers { result in
            switch result {
            case .success(let success):
                self.createGithubUsers(responseArray: success)
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    private func createGithubUsers(responseArray: [GithubModel]) {
        var localusers = [UserDisplay]()
        for item in responseArray {
            localusers.append(UserDisplay(name: item.login, id: item.id))
        }
        users = localusers
    }
    
}
