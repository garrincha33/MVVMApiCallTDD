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
        tableViewController = UserTableViewController(viewModel: viewModel)
        viewModel = UserViewModel(userService: UserService.init())

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

}


