//
//  TicketsViewModel.swift
//  ZendeskApp
//
//  Created by Elton Mendes Viera on 09/08/2017.
//  Copyright © 2017 EltonMendes. All rights reserved.
//

import UIKit

class TicketsViewModel: NSObject {
    
    let ticketClient : TicketClient = TicketClient()
    var dataSource : [Ticket] = []
    
    func fetchTickets(success : @escaping TicketSuccessBlock , failure : @escaping TicketFailureBlock) {
        ticketClient.fetchTickets(success: { (tickets) in
            self.dataSource = tickets
            success(tickets)
        }) { (error) in
            self.dataSource.removeAll()
            failure(error)
        }
    }
    
    // MARK: TableView DataSource
    
    func numberOfRows() -> Int {
        return dataSource.count
    }
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func ticketForRow(row : Int) -> Ticket {
        return dataSource[row] as Ticket
    }
}
