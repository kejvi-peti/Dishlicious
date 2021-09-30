//
//  DishliciousApp.swift
//  Shared
//
//  Created by Kejvi Peti on 2021-09-29.
//

import SwiftUI

@main
struct DishliciousApp: App {
    var body: some Scene {
        WindowGroup {
            HStack{
                Spacer()
                VStack{
                    Spacer()
                    ContentView()
                    Spacer()
                }
                Spacer()
            }.background(SwiftUI.Color.orange.edgesIgnoringSafeArea(.all))
        }
    }
}
