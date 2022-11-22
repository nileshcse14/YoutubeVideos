//
//  ContentViewModel.swift
//  DispatchBarrierDmeo
//
//  Created by Nilesh on 13/11/22.
//

import Foundation

struct Ticket {
    var number: Int
    var name: String
}

class ContentViewModel {
    
    var availableTicket = 5
    private let concurrentQueue = DispatchQueue(label: "com.gcd.DispatchBarrierDemo", attributes: .concurrent)
    
    var tickets = [Ticket(number: 3, name: "Nilesh"),
                   Ticket(number: 2, name: "Ramesh"),
                   Ticket(number: 4, name: "Mahesh"),
                   Ticket(number: 2, name: "Somesh")]

    
    func buyTickets() {
        for ticket in tickets {
            concurrentQueue.async(flags: .barrier) {
                self.book(ticket: ticket)
            }
        }
    }
    
    func book(ticket: Ticket) {
        print("ticket booking started \(ticket.name)")
        sleep(1)
        if availableTicket >= ticket.number {
            availableTicket = availableTicket - ticket.number
            print("Ticket is successfull \(ticket.name)")
        } else {
            print("Ticket is unsuccessfull \(ticket.name)")
        }
        
        /*
         Ticket is successfull Somesh
         Ticket is unsuccessfull Ramesh
         Ticket is successfull Mahesh
         Ticket is successfull Nilesh
         */
    }
    
    func doSomethingElse() {
        print("Here I am always doing what I want")
    }
}
