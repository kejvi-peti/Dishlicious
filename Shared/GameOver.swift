//
//  GameOver.swift
//  Dishlicious (iOS)
//
//  Created by Kejvi Peti on 2021-09-30.
//

import SwiftUI
import SafariServices


struct GameOver : View{
    @Binding var mainMenu: Bool
    @Binding var lastNamePressed: String
    
    var body: some View{
        
        VStack(content: {
            Text("Dish selected!")
                .font(.title)
                .padding(.bottom, 30)
                .foregroundColor(.orange)
            
            Image(lastNamePressed)
                .resizable()
                .frame(width: 200, height: 200)
                .cornerRadius(20)
                .overlay(RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.orange, lineWidth: 4))
                .shadow(radius: 5)
            
            Text(getDishName())
                .bold()
                .padding(.top, 10)
                .padding(.leading, 20)
                .padding(.trailing, 20)
                .multilineTextAlignment(.center)
            
            Text(getNativeName())
                .italic()
                .multilineTextAlignment(.center)
            
            Text(getHistory())
                .padding(10)
                .multilineTextAlignment(.center)
            
            Button(action: {
                if let url = URL(string: getRecipeUrl()){
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                }
            }, label: {
                Text("Go To Recipe").bold().foregroundColor(.orange)
            }).padding(5)

            Button(action: {
                mainMenu.toggle()
            }, label: {
                Text("Main Menu").bold().foregroundColor(.orange)
            }).padding(5)
        })

    }
    
    func getDishName() -> String {
        let name = recipiesData.filter{$0.values.contains(lastNamePressed)}.first
        return name?["name"] ?? ""
    }
    func getNativeName() -> String {
        let name = recipiesData.filter{$0.values.contains(lastNamePressed)}.first
        return name?["nativeName"] ?? ""
    }
    func getHistory() -> String {
        let name = recipiesData.filter{$0.values.contains(lastNamePressed)}.first
        return name?["history"] ?? ""
    }
    func getRecipeUrl() -> String {
        let name = recipiesData.filter{$0.values.contains(lastNamePressed)}.first
        return name?["recipeURL"] ?? ""
    }
    
}
