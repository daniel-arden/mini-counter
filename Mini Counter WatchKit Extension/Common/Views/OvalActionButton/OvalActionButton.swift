//
//  OvalActionButton.swift
//  Mini Counter WatchKit Extension
//
//  Created by Daniel Arden on 03.11.2021.
//

import SwiftUI

struct OvalActionButton: View {
    @Environment(\.isEnabled) private var isEnabled: Bool

    let title: String
    let buttonColor: Color
    let action: () -> Void

    var body: some View {
        Button(
            title.uppercased(),
            action: action
        )
        .buttonStyle(OvalButtonStyle(buttonColor: buttonColor))
        .opacity(!isEnabled ? 0.3 : 1.0)
        .padding([Edge.Set.top, Edge.Set.bottom], 1)
    }
}

// MARK: - Preview
#if DEBUG
struct OvalActionButton_Previews: PreviewProvider {
    static var previews: some View {
        OvalActionButton(
            title: "Oval action button",
            buttonColor: Color.pistachio,
            action: {}
        )
        .previewLayout(PreviewLayout.sizeThatFits)
    }
}
#endif
