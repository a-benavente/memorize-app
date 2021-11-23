//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by amanda on 9/12/21.
//

import SwiftUI




class EmojiMemoryGame: ObservableObject {
    
    //essentially making the variable global, but keeping the namespace within the class
    //type variable
    static let emojis = ["🚕", "🚌", "🏎", "🛵", "🚜", "✈️", "🚃", "🚀", "🚁", "⛵️", "🛥", "🏍", "🚎", "🚂", "🚚", "🛴", "🚆", "🚊"]
    
    //type funcition
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in emojis[pairIndex]
    }
    }

    //model is a struct, the code below is creating it
    //by making our model private, we protect it from ill-behaving Views
    //making model private hides other info that you may not want/need Views to see
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    
    //this allows the model to be private, while still allowing us to read the cards
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
        //we can only get the value because it is a function, we cannot set the value
        //Views can now get ViewModel's var
        //we do this function to get a cpoy from the model of cards 
    }
    
    // MARK - Intent(s)

    func choose( _ card: MemoryGame<String>.Card){
        objectWillChange.send()
        model.choose(card)
    }

}


