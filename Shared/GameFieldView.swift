//
//  GameFieldView.swift
//  Dishlicious (iOS)
//
//  Created by Kejvi Peti on 2021-09-29.
//

import SwiftUI

struct GameField: View {
    @Binding var mainMenu : Bool
    @Binding var difficulty : Int
    @State var count = 0;
    @State var firstImage = "Image-1"
    @State var secondImage = "Image-2"
    
    var body: some View {
        Spacer()
        Button {
            immagePressed(button: 1)
        } label: {
            Image(firstImage)
                .resizable()
                .frame(width: 300, height: 300)
        }
        
        Spacer()
        
        Button {
            immagePressed(button: 2)
        } label: {
            Image(secondImage)
                .resizable()
                .frame(width: 300, height: 300)
        }
        
        Spacer()
        Button {
            print("Going Back")
            mainMenu.toggle()
        } label: {
            Text("Go Back")
                .font(.system(size: 30))
        }
    }
    
    func immagePressed(button: Int){
        if button == 1 {
            count += 1
            print("First Image tapped")
            print(count)
        }else{
            count += 1
            print("Second Image tapped")
            print(count)
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameField(mainMenu: .constant(true), difficulty: .constant(1))
    }
}


struct GameBrain {
    
    var data = recipiesData
    
    mutating func removeOne(with name: String){
        data = data.filter{!$0.values.contains(name)}
    }
}

