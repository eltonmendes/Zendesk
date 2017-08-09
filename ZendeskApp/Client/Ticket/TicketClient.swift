//
//  TicketClient.swift
//  ZendeskApp
//
//  Created by Elton Mendes Viera on 09/08/2017.
//  Copyright © 2017 EltonMendes. All rights reserved.
//

import UIKit

typealias TicketSuccessBlock = (_ tickets: Array<Ticket>) -> Void
typealias TicketFailureBlock = (_ error: NSError?) -> Void

enum TicketEndpoints : String {
    case ticketListPath = "/api/v2/tickets.json/"
}

class TicketClient: DefaultClient {
    
    func fetchTickets(success : @escaping TicketSuccessBlock, failure : @escaping TicketFailureBlock) {
        performGETRequestWithURL(path: TicketEndpoints.ticketListPath.rawValue ) { (response) in
            switch response.result {
            case .success(let value):
                let jsonData = try? JSONSerialization.data(withJSONObject: value)
                let decodedTickets = try? JSONDecoder().decode(TicketsResponse.self, from: jsonData!)
                success((decodedTickets?.tickets)!)
            case .failure(let error):
                failure(error as NSError)
            }
        }
    }
    
}
