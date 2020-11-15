//
//  Concentration.swift
//  concentration
//
//  Created by MacBook Pro on 15/10/20.
//

import Foundation

struct  Concentration {
    private(set) var cards = [Card] ()
    
    private var indexOfOneAndOnlyFacedUpCard: Int? {
        get {
            return cards.indices.filter {cards[$0].isFacedUp}.oneAndOnly
            /*var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFacedUp {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex*/
        }
        set {
            for index in cards.indices {
                cards[index].isFacedUp = (index == newValue)
            }
        }
    }
     
    mutating  func chooseCard(at index: Int){
        assert(cards.indices.contains(index), "Concentration.chooseCard(at \(index)): chosen index not in the cards")
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFacedUpCard, matchIndex != index { 
                if cards[matchIndex] == cards[index] {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFacedUp = true
            } else {
                indexOfOneAndOnlyFacedUpCard = index
            }
        }
    }
    
    init (numberOfPairsOfCards: Int){
        assert(numberOfPairsOfCards > 0, "Concentration.init(numberOfPairsOfCards \(numberOfPairsOfCards)): has to be greater than 0")
        for _  in 0..<numberOfPairsOfCards {
            let card = Card()
            cards.append(card)
            cards.append(card)
            cards.shuffle()
        }
    }
}

extension Collection {
    var oneAndOnly: Element? {
        return count == 1 ? first : nil
    }
}
