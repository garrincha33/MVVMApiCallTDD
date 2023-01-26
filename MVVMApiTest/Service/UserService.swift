//
//  UserService.swift
//  MVVMApiTest
//
//  Created by Richard Price on 26/01/2023.
//

import Foundation

class UserService {
    func fetchUsers(completion: @escaping ([UserModel]?) -> Void) {
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            }
            guard let data = data else {
                completion(nil)
                return
            }
            let users = try? JSONDecoder().decode([UserModel].self, from: data)
            completion(users)
        }
        .resume()
    }
}
