//
//  ZendeskTicketsTableViewController.swift
//  ZendeskApp
//
//  Created by Elton Mendes Viera on 09/08/2017.
//  Copyright © 2017 EltonMendes. All rights reserved.
//

import UIKit

class TicketsTableViewController: UITableViewController {
    
    let viewModel = TicketsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        fetchTickets()
    }
    
    func setupLayout() {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func refreshTableviewIfNeeded() {
        tableView.reloadData()
    }
    
    func fetchTickets() {
        viewModel.fetchTickets(success: { (tickets) in
            self.refreshTableviewIfNeeded()
        }) { (error) in
            self.refreshTableviewIfNeeded()
        }
    }
}

enum TicketsTableConfiguration : String {
    case cellIdentifier = "TicketCell"
}

extension TicketsTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TicketsTableConfiguration.cellIdentifier.rawValue, for: indexPath) as? TicketsTableViewCell
        
        let ticket = viewModel.ticketForRow(row: indexPath.row)
        cell?.setupCellWithTicket(ticket: ticket)
        return cell!
    }
}
