//
//  Card.swift
//  concentration
//
//  Created by MacBook Pro on 15/10/20.
//

import Foundation

struct Card: Hashable {
    var hashValue: Int {return identifier}
    var isFacedUp = false
    var isMatched = false
    private var identifier: Int
    
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier==rhs.identifier
    }
    
    private static var identifierFactory = 0
    
    private static func getUniqueIdentifier()->Int {
        identifierFactory = Card.identifierFactory+1
        return identifierFactory
    }
    
    init () {
        self.identifier = Card.getUniqueIdentifier()
    }
}
