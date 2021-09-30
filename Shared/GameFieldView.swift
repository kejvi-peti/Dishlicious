//
//  GameFieldView.swift
//  Dishlicious (iOS)
//
//  Created by Kejvi Peti on 2021-09-29.
//

import SwiftUI

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
    
    // animation states
    @State var firstFade = false
    @State var secondFade = false
    @State var direction = 1.0;
    
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
            VStack(content: {
                Spacer()
                Button(action: {
                    self.lastNamePressed = self.firstImage
                    if(count == 3){
                        gameOver = true
                    }
                    
                    self.secondFade.toggle()
                    self.direction = -1.0;
                    
                    // delayed image update
                    DispatchQueue.main.asyncAfter(deadline: .now() + kAnimationDuration) {
                        self.direction = 1.0;
                        
                        withAnimation {
                            self.secondImage = data.randomElement()?["image"] ?? ""
                            self.secondFade.toggle()
                        }
                    }
                    
                    self.data = self.data.filter{!$0.values.contains(self.secondImage)}
                    count = count + 1
                }, label: {
                    Image(firstImage)
                        .resizable()
                        .frame(width: 300, height: 300)
                        .cornerRadius(20)
                        .overlay(RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.black, lineWidth: 4))
                })
                .offset(x: firstFade ? kAnimationOffset * direction : 0)
                .opacity(firstFade ? 0 : 1)
                .animation(.easeInOut(duration: kAnimationDuration), value: self.firstFade)
                .animation(.linear(duration: 0), value: self.direction)
                
                Spacer()
                
                Button(action: {
                    self.lastNamePressed = self.secondImage
                    if(count == 3){
                        gameOver = true
                    }
                    
                    self.firstFade.toggle()
                    self.direction = -1
                    
                    // delayed image update
                    DispatchQueue.main.asyncAfter(deadline: .now() + kAnimationDuration) {
                        self.direction = 1
                        
                        withAnimation {
                            self.firstImage = data.randomElement()?["image"] ?? ""
                            self.firstFade.toggle()
                        }
                    }
                    
                    self.data = self.data.filter{!$0.values.contains(self.firstImage)}
                    count = count + 1
                }, label: {
                    Image(secondImage)
                        .resizable()
                        .frame(width: 300, height: 300)
                        .cornerRadius(20)
                        .overlay(RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.black, lineWidth: 4))
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
                }
            })
            .animation(.easeInOut)
            .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .trailing)))
        }else{
            GameOver(
                mainMenu: $mainMenu,
                lastNamePressed: $lastNamePressed
            )
            .animation(.easeInOut)
            .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .trailing)))
        }
    }
}


struct GameBrain {
    
    var data = recipiesData
    
    mutating func removeOne(with name: String){
        data = data.filter{!$0.values.contains(name)}
    }
    
    mutating func getRandom() -> String {
        let name = data.randomElement()?["image"] ?? ""
        removeOne(with: name)
        return name
    }
}
