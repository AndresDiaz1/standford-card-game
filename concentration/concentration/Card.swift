//
//  Card.swift
//  concentration
//
//  Created by MacBook Pro on 15/10/20.
//

import Foundation

struct Card {
    var isFacedUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier()->Int {
        identifierFactory = Card.identifierFactory+1
        return identifierFactory
    }
    
    init () {
        self.identifier = Card.getUniqueIdentifier()
    }
}
