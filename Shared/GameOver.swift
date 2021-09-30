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
        
        Text("game over")
        Image(lastNamePressed)
            .resizable()
            .frame(width: 200, height: 200)
        Text(getDishName())
        Text(getNativeName())
        Text(getHistory())
        Text(getRecipeUrl())
        Button {
            if let url = URL(string: getRecipeUrl()){
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        } label: {
            Text("Go To Recipe")
        }

        Button {
            mainMenu.toggle()
        } label: {
            Text("Main Menu")
        }

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
