//
//  UserViewModel.swift
//  MVVMApiTest
//
//  Created by Richard Price on 26/01/2023.
//
import Foundation

class UserViewModel {
    let userService: UserService
    
    init(userService: UserService) {
        self.userService = userService
    }
    
    var users: [UserModel] = []
    
    var count: Int {
        return users.count
    }
    
    func user(at index: Int) -> UserModel {
        return users[index]
    }
    
    func fetchUsers(completion: @escaping ([UserModel]?) -> Void) {
        userService.fetchUsers { (users) in
            completion(users)
        }
    }
}
