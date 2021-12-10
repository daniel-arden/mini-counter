//
//  CircularButton.swift
//  Mini Counter WatchKit Extension
//
//  Created by Daniel Arden on 13.11.2021.
//

import SwiftUI

struct CircularImageButton: View {
    @Environment(\.isEnabled) private var isEnabled: Bool

    private let systemImageName: String
    private let color: Color
    private let action: () -> Void

    init(
        _ systemImageName: String,
        color: Color,
        action: @escaping () -> Void
    ) {
        self.systemImageName = systemImageName
        self.color = color
        self.action = action
    }

    var body: some View {
        Button(action: action) {
            Image(systemName: systemImageName)
        }
        .buttonStyle(CircularButtonStyle(color: color))
        .opacity(isEnabled ? 1.0 : 0.3)
    }
}

// MARK: - Preview

#if DEBUG
    struct CircularButton_Previews: PreviewProvider {
        static var previews: some View {
            CircularImageButton("minus", color: .greenSourCandy, action: {})
                .squareFrame(32)
                .previewLayout(.sizeThatFits)
        }
    }
#endif
