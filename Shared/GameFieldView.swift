//
//  GameFieldView.swift
//  Dishlicious (iOS)
//
//  Created by Kejvi Peti on 2021-09-29.
//

import SwiftUI
import AVFoundation

let kAnimationDuration = 0.25
let kAnimationOffset = 50.0

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
    
    // animation states
    @State var firstFade = false
    @State var secondFade = false
    @State var direction = 1.0;
    
    init(d: [[String: String]], c: Int, f: String, s: String, gameOver: Bool, main: Binding<Bool>, diff: Binding<Int>){
        let names = Recipies.getRecipe(with: "\(diff.wrappedValue)")
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
            VStack(content: {
                Spacer()
                Button(action: {
                    playSound("bling.wav")
                    self.lastNamePressed = self.firstImage
                    if (count == 3 || self.data.count <= 0) {
                        // user has seen enough or there are no recipes left, game over
                        gameOver = true
                        return
                    }
                    
                    self.secondFade.toggle()
                    self.direction = -1.0;
                    
                    // delayed image update
                    let futureImage = self.data.randomElement()?["image"] ?? ""
                    self.data = self.data.filter{!$0.values.contains(futureImage)}
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + kAnimationDuration) {
                        self.direction = 1.0;
                        
                        withAnimation {
                            self.secondImage = futureImage
                            self.secondFade.toggle()
                        }
                    }
                }, label: {
                    Image(firstImage)
                        .resizable()
                        .frame(width: 300, height: 300)
                        .cornerRadius(20)
                        .overlay(RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.orange, lineWidth: 4))
                        .shadow(radius: 5)
                })
                .offset(x: firstFade ? kAnimationOffset * direction : 0)
                .opacity(firstFade ? 0 : 1)
                .animation(.easeInOut(duration: kAnimationDuration), value: self.firstFade)
                .animation(.linear(duration: 0), value: self.direction)
                
                Spacer()
                
                Button(action: {
                    playSound("bling.wav")
                    self.lastNamePressed = self.secondImage
                    if (count == 3 || self.data.count <= 0) {
                        // user has seen enough or there are no recipes left, game over
                        gameOver = true
                        return
                    }
                    
                    self.firstFade.toggle()
                    self.direction = -1
                    
                    // delayed image update
                    let futureImage = self.data.randomElement()?["image"] ?? ""
                    self.data = self.data.filter{!$0.values.contains(futureImage)}
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + kAnimationDuration) {
                        self.direction = 1
                        
                        withAnimation {
                            self.firstImage = futureImage
                            self.firstFade.toggle()
                        }
                    }
                }, label: {
                    Image(secondImage)
                        .resizable()
                        .frame(width: 300, height: 300)
                        .cornerRadius(20)
                        .overlay(RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.orange, lineWidth: 4))
                        .shadow(radius: 5)
                })
                .offset(x: secondFade ? kAnimationOffset * direction : 0)
                .opacity(secondFade ? 0 : 1)
                .animation(.easeInOut(duration: kAnimationDuration), value: self.secondFade)
                .animation(.linear(duration: 0), value: self.direction)
                
                Spacer()
                Button {
                    print("Going Back")
                    mainMenu.toggle()
                } label: {
                    Text("Go Back")
                        .font(.system(size: 30))
                        .foregroundColor(.orange)
                }
            })
            .animation(.easeInOut)
            .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .trailing)))
            .onAppear {
                playSound("woosh.mp3")
            }

        }else{
            GameOver(
                mainMenu: $mainMenu,
                lastNamePressed: $lastNamePressed
            )
            .animation(.easeInOut)
            .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .trailing)))
            
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
