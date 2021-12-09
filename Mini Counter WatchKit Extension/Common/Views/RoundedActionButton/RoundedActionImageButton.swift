//
//  OvalActionImageButton.swift
//  Mini Counter WatchKit Extension
//
//  Created by Daniel Arden on 03.11.2021.
//

import SwiftUI

struct RoundedActionImageButton: View {
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
                .resizable()
                .aspectRatio(1.0, contentMode: ContentMode.fit)
        }
        .buttonStyle(BorderedButtonStyle())
        /*
         Below, there is a workaround for getting the
         system button on watchOS to be colored with a tint color.
         By setting the opacity to 1.0, the system does not draw the button
         with full color, since .opacity modifier works just as a multiplication
         of the opacity that's provided by the system for given component.

         Link: https://developer.apple.com/forums/thread/658058
         */
        .tint(color.opacity(10))
        .foregroundColor(Color.white)
        .opacity(isEnabled ? 1.0 : 0.3)
    }
}

// MARK: - Preview
#if DEBUG
    struct OvalActionImageButton_Previews: PreviewProvider {
        static var previews: some View {
            RoundedActionImageButton(
                "gearshape.fill",
                color: Color.greenSourCandy,
                action: {}
            )
            .previewLayout(PreviewLayout.sizeThatFits)
        }
    }
#endif
