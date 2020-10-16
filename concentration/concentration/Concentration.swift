//
//  Concentration.swift
//  concentration
//
//  Created by MacBook Pro on 15/10/20.
//

import Foundation

class Concentration {
    var cards = [Card] ()
    
    var indexOfOneAndOnlyFacedUpCard: Int?
    
    func chooseCard(at index: Int){
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFacedUpCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFacedUp = true
                indexOfOneAndOnlyFacedUpCard = nil
            } else {
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFacedUp = false
                    cards[index].isFacedUp = true
                    indexOfOneAndOnlyFacedUpCard = index
                }
            }
        }
    }
    
    init (numberOfPairsOfCards: Int){
        for _  in 0..<numberOfPairsOfCards {
            let card = Card()
            cards.append(card)
            cards.append(card)
            cards.shuffle()
        }
    }
}
