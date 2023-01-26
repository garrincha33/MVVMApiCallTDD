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
        userModel = UserModel(id: 1, name: "test", email: "test", userName: "test")
        viewModel = UserViewModel(users: [userModel])
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
        
    }
    
    func testForUsersFromUserModel() {
        let user = [UserModel(id: 1, name: "test", email: "test@example.com", userName: "test")]
        viewModel = UserViewModel(users: user)
        let users = viewModel.users
        XCTAssertNotNil(users)
    }
    
    func testReturnUserCount() {
        let user1 = [UserModel(id: 1, name: "test", email: "test", userName: "test")]
        let expectedCount = 1
        viewModel = UserViewModel(users: user1)
        
        XCTAssertEqual(expectedCount, viewModel.count)
    }
    
    
    
}

struct UserViewModel {
    var users: [UserModel] = []
    
    var count: Int {
        return users.count
    }
    
    func user(at index: Int) -> UserModel {
        return users[index]
    }
    
}


