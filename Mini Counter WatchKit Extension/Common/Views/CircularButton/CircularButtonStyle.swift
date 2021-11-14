//
//  CircularButtonStyle.swift
//  Mini Counter WatchKit Extension
//
//  Created by Daniel Arden on 13.11.2021.
//

import SwiftUI

struct CircularButtonStyle: ButtonStyle {
    let buttonColor: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(Font.headline)
            .foregroundColor(Color.white)
            .maxFrame()
            .background(buttonColor)
            .clipShape(Circle())
            .opacity(configuration.isPressed ? 0.7 : 1.0)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}
