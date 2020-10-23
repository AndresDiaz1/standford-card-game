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
    
    private static var identifierFactory = 0
    
    private static func getUniqueIdentifier()->Int {
        identifierFactory = Card.identifierFactory+1
        return identifierFactory
    }
    
    init () {
        self.identifier = Card.getUniqueIdentifier()
    }
}
