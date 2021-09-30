//
//  ContentView.swift
//  Shared
//
//  Created by Kejvi Peti on 2021-09-29.
//

import SwiftUI

struct ContentView: View {
    @State var gameFieldView = false
    @State var difficulty = 0
    
    var body: some View {
        if gameFieldView {
            
            GameField(
                d: recipiesData,
                c: 0,
                f: "",
                s: "",
                gameOver: false,
                main: $gameFieldView,
                diff: $difficulty
            )
            .animation(.easeInOut)
            .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .trailing)))
            
        }else{
            MainMenu(
                gameField: $gameFieldView,
                difficulty: $difficulty
            )
            .animation(.easeInOut)
            .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .trailing)))
            
        }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(gameFieldView: true, difficulty: 0)
    }
}
