//
//  MVVMUserTableViewControllerTests.swift
//  MVVMApiTestTests
//
//  Created by Richard Price on 26/01/2023.
//

import Foundation

import XCTest
@testable import MVVMApiTest

final class MVVMUserTableViewControllerTests: XCTestCase {
    
    var tableViewController: UserTableViewController!
    var viewModel: UserViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = UserViewModel(userService: UserService.init())
        tableViewController = UserTableViewController(viewModel: viewModel)
    }
    
    override func tearDown() {
        tableViewController = nil
        viewModel = nil
        super.tearDown()
        
    }
    
    func testForTableViewControllerBackgroundColor() {
        let expectedColor = UIColor.purple
        
        XCTAssertEqual(expectedColor, tableViewController.tableView.backgroundColor)
    }
    
    func testUserTableViewControllerRegistersCell() {
        let controller = UserTableViewController(viewModel: viewModel)
        controller.viewDidLoad()
        let cell = controller.tableView.dequeueReusableCell(withIdentifier: String(describing: UITableViewCell.self))
        XCTAssertNotNil(cell, "cell should be registed")
    }
    
    func testViewModelCountInController() {
        let tableView = tableViewController.tableView
        let expected = viewModel.count
        tableViewController.viewDidLoad()
        XCTAssertEqual(expected, tableView?.numberOfRows(inSection: expected))
    }
    
    func testFetchUsersFromApi() {

        let mockUserService = MockUserService()
        mockUserService.users = [UserModel(id: 1, name: "Rich", username: "Richy77", email: "test@test.com")]
        let viewModel = UserViewModel(userService: mockUserService)
        
        viewModel.fetchNewUsers { (user) in
            guard let _ = user else {
                XCTFail("failed to fetch user")
                return
            }
            
            let tableView = UITableView()
            let indexPath = IndexPath(row: 0, section: 0)
            
            let myTableView = UserTableViewController(viewModel: viewModel)
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: String(describing: UITableViewCell.self))
            let cell = myTableView.tableView(tableView, cellForRowAt: indexPath)
            XCTAssertEqual(cell.textLabel?.text, "Rich")
        }
    }
}

class MockUserService: UserService {
    var users: [UserModel] = []
    func fetchNewUsers(completion: @escaping ([UserModel]?) -> Void) {
        completion(users)
    }
}

