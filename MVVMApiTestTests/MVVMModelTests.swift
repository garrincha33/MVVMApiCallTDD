//
//  MVVMModelTests.swift
//  MVVMApiTestTests
//
//  Created by Richard Price on 26/01/2023.
//

//
//  MVVMModelTests.swift
//  MVVMApiCallExampleTesting
//
//  Created by Richard Price on 26/01/2023.
//

import XCTest
@testable import MVVMApiTest

final class MVVMModelTests: XCTestCase {
    
    var userModel: UserModel!
    
    override func setUp() {
        super.setUp()
        userModel = UserModel(id: 1, name: "test", email: "test", userName: "test")
    }
    
    override func tearDown() {
        userModel = nil
        super.tearDown()
    }
    
    func testModelHasAllRequiredAPIValues() {
        let id = 1
        let name = "test"
        let email = "test"
        let userName = "test"
    
        let newUser = UserModel(id: 1, name: "test", email: "test", userName: "test")
        
        XCTAssertEqual(newUser.id, id)
        XCTAssertEqual(newUser.name, name)
        XCTAssertEqual(newUser.userName, userName)
        XCTAssertEqual(newUser.email, email)
    }
}

