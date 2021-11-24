//
//  OvalButtonStyle.swift
//  Mini Counter WatchKit Extension
//
//  Created by Daniel Arden on 03.11.2021.
//

import SwiftUI

struct OvalButtonStyle: ButtonStyle {
    let buttonColor: Color

    func makeBody(configuration: OvalButtonStyle.Configuration) -> some View {
        configuration.label
            .font(Font.headline)
            .foregroundColor(Color.white)
            .maxWidth()
            .frame(height: 44)
            .background(buttonColor)
            .cornerRadius(8)
            .opacity(configuration.isPressed ? 0.7 : 1.0)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}
