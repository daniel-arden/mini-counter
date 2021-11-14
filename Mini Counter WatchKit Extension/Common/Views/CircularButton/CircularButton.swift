//
//  CircularButton.swift
//  Mini Counter WatchKit Extension
//
//  Created by Daniel Arden on 13.11.2021.
//

import SwiftUI

struct CircularButton: View {
    @Environment(\.isEnabled) private var isEnabled: Bool
    
    let systemImageName: String
    let buttonColor: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: systemImageName)
        }
        .buttonStyle(CircularButtonStyle(buttonColor: buttonColor))
        .opacity(!isEnabled ? 0.3 : 1.0)
    }
}

// MARK: - Preview
#if DEBUG
struct CircularButton_Previews: PreviewProvider {
    static var previews: some View {
        CircularButton(
            systemImageName: "minus",
            buttonColor: Color.green,
            action: {}
        )
        .squareFrame(32)
        .previewLayout(PreviewLayout.sizeThatFits)
    }
}
#endif
