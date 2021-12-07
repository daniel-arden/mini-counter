//
//  OvalButtonStyle.swift
//  Mini Counter WatchKit Extension
//
//  Created by Daniel Arden on 03.11.2021.
//

import SwiftUI

struct OvalButtonStyle: ButtonStyle {
    let buttonColor: Color
    let style: OvalButtonStyle.Style

    func makeBody(configuration: OvalButtonStyle.Configuration) -> some View {
        configuration.label
            .font(Font.headline)
            .foregroundColor(Color.white)
            .maxWidth()
            .frame(height: style.height)
            .background(buttonColor)
            .cornerRadius(style.cornerRadius)
            .opacity(configuration.isPressed ? 0.7 : 1.0)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}

// MARK: - Kind
extension OvalButtonStyle {
    /// Distinguishes between specific styles based on whether then button is
    /// shown in a non scrolling view or a scrolling view.
    /// Does not respect styles described in HIG for Apple Watch Models 3 and lower
    enum Style {
        case scrollingView
        case nonScrollingView
        
        /// Corner radius based on HIG's recommendations
        /// Link: https://developer.apple.com/design/human-interface-guidelines/watchos/elements/buttons/
        var cornerRadius: CGFloat {
            switch self {
            case .scrollingView:
                return 9.0
            case .nonScrollingView:
                return 22.0
            }
        }

        var height: CGFloat {
            return 42.0
        }
    }
}
