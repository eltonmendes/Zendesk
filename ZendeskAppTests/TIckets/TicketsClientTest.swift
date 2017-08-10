//
//  TicketsClientTest.swift
//  ZendeskAppTests
//
//  Created by Elton Mendes Viera on 09/08/2017.
//  Copyright © 2017 EltonMendes. All rights reserved.
//

import XCTest


class TicketsClientTest: XCTestCase {
    
    let ticketClient = TicketClient()
        
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testTicketsClient() {
        let expect = expectation(description: "Should return tickets")
        
        ticketClient.fetchTickets(success: { (tickets) in
            XCTAssertNotNil(tickets, "tickets should not be nil")
            expect.fulfill()
        }) { (error) in
            XCTAssertNotNil(error, "error should not be nil")
            expect.fulfill()
        }
        
        waitForExpectations(timeout: 10, handler: nil)
    }
}
