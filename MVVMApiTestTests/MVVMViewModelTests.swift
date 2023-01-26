//
//  MVVMViewModelTests.swift
//  MVVMApiTestTests
//
//  Created by Richard Price on 26/01/2023.
//

import XCTest
@testable import MVVMApiTest

final class MVVMViewModelTests: XCTestCase {
    
    var viewModel: UserViewModel!
    var userModel: UserModel!
    
    override func setUp() {
        super.setUp()
        userModel = UserModel(id: 1, name: "test", username: "test", email: "test")
        viewModel = UserViewModel(userService: UserService.init())
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
        
    }
    
    func testForUsersFromUserModel() {
        viewModel = UserViewModel(userService: UserService.init())
        let users = viewModel.users
        XCTAssertNotNil(users)
    }
    
    func testReturnUserCount() {
        viewModel = UserViewModel(userService: UserService.init())
        let expectedCount = 0
        XCTAssertEqual(expectedCount, viewModel.count)
    }
    
//    func testForServiceInstantiation() {
//        let service = viewModel.userService
//        XCTAssertNotNil(service)
//    }
    
    func testForUsersFromApiinViewModel() {
        let userService = UserServiceMock()
        let viewModel = (userService)
        var users: [UserModel]?
        
        viewModel.fetchUsers {(user) in
            users = users
        }
        
        XCTAssertNil(users)
    }
    
    
}

class UserServiceMock {
    let users: [UserModel] = []
    func fetchUsers(completion: @escaping ([UserModel]?) -> Void) {
        completion(users)
    }
}




