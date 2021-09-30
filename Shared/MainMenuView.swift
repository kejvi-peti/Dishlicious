//
//  ContentView.swift
//  Shared
//
//  Created by Kejvi Peti on 2021-09-29.
//

import SwiftUI
import AVFoundation

struct MainMenu: View {
    
    @Binding var gameField: Bool
    @Binding var difficulty: Int
    @State var audioPlayer: AVAudioPlayer!
    
    var body: some View {
        
        VStack{
            Spacer()
            Text("DishLicious")
                .font(.system(size: 50))
            Spacer()
            Button {
                self.difficulty = 1
                self.gameField.toggle()
            } label: {
                Text("Easy")
                    .font(.system(size: 40))
                    .foregroundColor(.orange)
            }.padding()
            Button {
                self.difficulty = 2
                self.gameField.toggle()
            } label: {
                Text("Medium")
                    .font(.system(size: 40)).foregroundColor(.orange)
            }.padding()
            Button {
                self.difficulty = 3
                self.gameField.toggle()
            } label: {
                Text("Hard")
                    .font(.system(size: 40)).foregroundColor(.orange)
            }.padding()
            Spacer()
        }
            
    }

        
    
}
