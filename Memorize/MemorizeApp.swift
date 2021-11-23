//
//  MemorizeApp.swift
//  Memorize
//
//  Created by amanda on 9/4/21.
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
