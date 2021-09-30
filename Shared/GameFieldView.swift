//
//  GameFieldView.swift
//  Dishlicious (iOS)
//
//  Created by Kejvi Peti on 2021-09-29.
//

import SwiftUI

struct GameField: View {
    @State var data : [[String: String]]
    
    @Binding var mainMenu : Bool
    @Binding var difficulty : Int
    @State var count : Int;
    @State var firstImage : String
    @State var secondImage : String
    @State var gameOver: Bool
    @State var lastNamePressed: String
    
    init(data: [[String: String]], count: Int, f: String, s: String, gameOver: Bool, main: Binding<Bool>, diff: Binding<Int>){
        self.data = recipiesData
        self.firstImage = data.randomElement()?["image"] ?? ""
        self.secondImage = data.randomElement()?["image"] ?? ""
        self.count = count
        self.gameOver = false
        self._mainMenu = main
        self._difficulty = diff
        self.lastNamePressed = ""
        
        self.data = self.data.filter{!$0.values.contains("\(difficulty)")}
        
        self.data = self.data.filter{!$0.values.contains(firstImage)}
        self.data = self.data.filter{!$0.values.contains(secondImage)}
        
    }
    
    var body: some View {
        //ADD IF ELSE
        if(!gameOver){
            VStack{
                Spacer()
                Button {
                    self.lastNamePressed = self.firstImage
                    if(
                        (difficulty == 1 && count == 1) ||
                        (difficulty == 2 && count == 2) ||
                        (difficulty == 3 && count == 3)
                    
                    ){
                        gameOver = true
                    }
                    self.secondImage = data.randomElement()?["image"] ?? ""
                    self.data = self.data.filter{!$0.values.contains(self.secondImage)}
                    count = count + 1
                } label: {
                    Image(firstImage)
                        .resizable()
                        .frame(width: 300, height: 300)
                }
                
                Spacer()
                
                Button(action: {
                    self.lastNamePressed = self.secondImage
                    if(
                        (difficulty == 1 && count == 1) ||
                        (difficulty == 2 && count == 2) ||
                        (difficulty == 3 && count == 3)
                    
                    ){
                        gameOver = true
                    }
                    self.firstImage = data.randomElement()?["image"] ?? ""
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
            }
        }else{
            GameOver(mainMenu: $mainMenu, lastNamePressed: $lastNamePressed)
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
