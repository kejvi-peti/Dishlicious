//
//  Cards.swift
//  Dishlicious (iOS)
//
//  Created by Kejvi Peti on 2021-09-30.
//

import SwiftUI


@available(iOS 15.0, *)
struct SheetView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        Button("Press to dismiss") {
            dismiss()
        }
        .font(.title)
        .padding()
        .background(Color.black)
    }
}
