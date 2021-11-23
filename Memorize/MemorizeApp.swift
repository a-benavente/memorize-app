//
//  MemorizeApp.swift
//  Memorize
//
//  Created by amanduh on 9/4/21.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
