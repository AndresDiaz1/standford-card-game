//
//  ViewController.swift
//  concentration
//
//  Created by MacBook Pro on 4/10/20.
//

import UIKit

class ViewController: UIViewController {
    private lazy  var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    var numberOfPairsOfCards : Int {
        return (cardButtons.count+1 )/2        
    }
    private(set) var flipCount = 0 {
        didSet{
            updateFlipCOuntText()
        }
    }
    
    private func updateFlipCOuntText() {
        let attributes: [NSAttributedString.Key:Any] = [
            .strokeWidth: 5.0,
            .strokeColor: #colorLiteral(red: 0.5058823824, green: 0.3372549117, blue: 0.06666667014, alpha: 1)
        ]
        let attributedString = NSAttributedString(string:  "Flips: \(flipCount)", attributes: attributes)
        flipCountLabel.attributedText  = attributedString
    }
    
    //private var emojiChoices = ["🦇", "🦹", "🎃", "👻"]
    private var emojiChoices = "🦇🦹🎃👻"

    @IBOutlet private weak var flipCountLabel: UILabel! {
        didSet {
            updateFlipCOuntText()
        }
    }
    @IBOutlet private var cardButtons: [UIButton]!
     
    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber )
            updateViewFromModel()
        } else {
            print("card doesnt exists")
        }
    }
    
    private func updateViewFromModel () {
        for index in  cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            
            if (card.isFacedUp){
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0)  : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1) 
            }
        }
    }
     
    private var emoji = [Card:String]()
    private func emoji (for card: Card ) -> String {
        if emoji[card] == nil,   emojiChoices.count > 0 {
            let randomStringIndex = emojiChoices.index(emojiChoices.startIndex, offsetBy: emojiChoices.count.arc4random )
            emoji[card] = String(emojiChoices.remove(at: randomStringIndex  ))
        }
        return emoji[card ] ?? "?"
    }
}

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}
