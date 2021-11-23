//
//  ContentView.swift
//  Memorize
//
//  Created by amanda on 9/4/21.
//

import SwiftUI

struct ContentView: View {
 @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
       
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]){
                    ForEach(viewModel.cards) { card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card)
                            }
                    }
                }
                
            }
            .foregroundColor(.red)
        .padding(.horizontal)
        
    }
    
   
}

struct CardView: View{
    let card: MemoryGame<String>.Card
    
    var body: some View{
        
        ZStack{
            let shape = RoundedRectangle(cornerRadius: 20)
            
            
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            } else if card.isMatched {
                shape.opacity(0)
                
            }else {
                shape.fill()
            }
        }
    }
}



























//var body is not stored in memory - calculated by executing function
//return keyword is hidden by Swift to be more visually appealing
// function with no name
//        Text("Hello, world! Watch out, Amanda is killing the game!")
//            .padding()











struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
    }
}

