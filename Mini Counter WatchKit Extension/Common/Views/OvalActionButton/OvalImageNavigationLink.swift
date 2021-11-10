//
//  OvalImageNavigationLink.swift
//  Mini Counter WatchKit Extension
//
//  Created by Daniel Arden on 10.11.2021.
//

import SwiftUI

struct OvalImageNavigationLink<Destination>: View where Destination: View {
    @Environment(\.isEnabled) private var isEnabled: Bool

    let systemImageName: String
    let buttonColor: Color
    let destination: Destination
    
    init(
        systemImageName: String,
        buttonColor: Color,
        @ViewBuilder destination: @escaping () -> Destination
    ) {
        self.systemImageName = systemImageName
        self.buttonColor = buttonColor
        self.destination = destination()
    }

    var body: some View {
        NavigationLink(destination: destination) {
            OvalActionButtonImage(systemImageName: systemImageName)
        }
        .buttonStyle(OvalButtonStyle(buttonColor: buttonColor))
        .opacity(!isEnabled ? 0.3 : 1.0)
        .padding([Edge.Set.top, Edge.Set.bottom], 1)
    }
}
