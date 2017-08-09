//
//  TicketsTableViewCell.swift
//  ZendeskApp
//
//  Created by Elton Mendes Viera on 09/08/2017.
//  Copyright © 2017 EltonMendes. All rights reserved.
//

import UIKit

class TicketsTableViewCell: UITableViewCell {

    @IBOutlet weak var ticketNumberLabel: UILabel!
    @IBOutlet weak var ticketStatusLabel: UILabel!
    @IBOutlet weak var ticketDescriptionLabel: UILabel!
    @IBOutlet weak var ticketSubjectLabel: UILabel!
    
    func setupCellWithTicket(ticket : Ticket) {
        ticketNumberLabel.text = String(ticket.id)
        ticketStatusLabel.text = ticket.status
        ticketDescriptionLabel.text = ticket.description
        ticketSubjectLabel.text = ticket.subject
    }

}
