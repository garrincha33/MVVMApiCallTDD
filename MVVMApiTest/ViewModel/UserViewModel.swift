//
//  UserViewModel.swift
//  MVVMApiTest
//
//  Created by Richard Price on 26/01/2023.
//
import Foundation

class UserViewModel {
    private let userService: UserService
    
    var users: [UserModel] = []
    var count: Int {
        return users.count
    }
    
    func user(at index: Int) -> UserModel {
        print(users.count)
        return users[index]
        
    }

    init(userService: UserService) {
        self.userService = userService
    }
    
    func fetchNewUsers(completion: @escaping ([UserModel]?) -> Void) {
        userService.fetchUsers { (users) in
            self.users = users ?? []
            completion(users)
        }
    }
}

