//
//  GameFieldView.swift
//  Dishlicious (iOS)
//
//  Created by Kejvi Peti on 2021-09-29.
//

import SwiftUI
import AVFoundation

struct GameField: View {
    
    @State var data : [[String: String]]
    @Binding var mainMenu : Bool
    @Binding var difficulty : Int
    @State var count : Int;
    @State var firstImage : String
    @State var secondImage : String
    @State var gameOver: Bool
    @State var lastNamePressed: String
    @State var audioPlayer: AVAudioPlayer!
    
    init(d: [[String: String]], c: Int, f: String, s: String, gameOver: Bool, main: Binding<Bool>, diff: Binding<Int>){
        
        let names =  Recipies.getRecipe(with: "\(diff.wrappedValue)")
        self.firstImage = names[0]
        self.secondImage = names[1]
        self.data = Recipies.getRecipiesForDificulty(difficulty: "\(diff.wrappedValue)", f: names[0], s: names[1])
        self.count = c
        self.gameOver = false
        self._mainMenu = main
        self._difficulty = diff
        self.lastNamePressed = ""
    }
    
    var body: some View {
        //ADD IF ELSE
        if(!gameOver){
            VStack{
                Spacer()
                Button {
                    playSound("bling.wav")
                    self.lastNamePressed = self.firstImage
                    if(count == 3){
                        gameOver = true
                    }
                    self.secondImage = self.data.randomElement()?["image"] ?? ""
                    self.data = self.data.filter{!$0.values.contains(self.secondImage)}
                    count = count + 1
                } label: {
                    Image(firstImage)
                        .resizable()
                        .frame(width: 300, height: 300)
                }
                
                Spacer()
                
                Button(action: {
                    playSound("bling.wav")
                    self.lastNamePressed = self.secondImage
                    if(count == 3){
                        gameOver = true
                    }
                    self.firstImage = self.data.randomElement()?["image"] ?? ""
                    self.data = self.data.filter{!$0.values.contains(self.firstImage)}
                    count = count + 1
                }, label: {
                    Image(secondImage)
                        .resizable()
                        .frame(width: 300, height: 300)
                })
                
                Spacer()
                Button {
                    print("Going Back")
                    mainMenu.toggle()
                } label: {
                    Text("Go Back")
                        .font(.system(size: 30))
                }
            }.onAppear {
                playSound("woosh.mp3")
            }
        }else{
            GameOver(mainMenu: $mainMenu, lastNamePressed: $lastNamePressed)
        }
    }
    
    func playSound(_ soundFileName: String) {
        guard let soundURL = Bundle.main.url(forResource: soundFileName, withExtension: nil) else {
                    fatalError("Unable to find \(soundFileName) in bundle")
                }
                do {
                    audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
                } catch {
                    print(error.localizedDescription)
                }
                audioPlayer.play()
    }
}
