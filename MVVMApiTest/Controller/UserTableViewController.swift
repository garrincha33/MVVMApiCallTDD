//
//  UserTableViewController.swift
//  MVVMApiTest
//
//  Created by Richard Price on 26/01/2023.
//
import UIKit

class UserTableViewController: UITableViewController {
    var viewModel: UserViewModel
    
    init(viewModel: UserViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        fetchUsers()
    }
    
    private func setupTableView() {
        tableView.backgroundColor = .purple
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: String(describing: UITableViewCell.self))
    }
    
    private func fetchUsers() {
        viewModel.fetchNewUsers { (users) in
            self.viewModel.users = users?.compactMap { $0 } ?? []
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

extension UserTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UITableViewCell.self), for: indexPath)
        let user = viewModel.user(at: indexPath.row)
        cell.textLabel?.text = user.name
        return cell
    }
}


