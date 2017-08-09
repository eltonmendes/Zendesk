//
//  TicketsResponse.swift
//  ZendeskApp
//
//  Created by Elton Mendes Viera on 09/08/2017.
//  Copyright © 2017 EltonMendes. All rights reserved.
//

import UIKit

struct TicketsResponse: Codable {
    let count : Int
    let tickets : [Ticket]
}

struct Ticket : Codable {
    let id : Int
    let subject : String
    let description : String
    let status : String
}
