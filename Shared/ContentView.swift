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
            GameField(mainMenu: $gameFieldView, difficulty: $difficulty)
        }else{
            MainMenu(gameField: $gameFieldView, difficulty: $difficulty)
        }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
