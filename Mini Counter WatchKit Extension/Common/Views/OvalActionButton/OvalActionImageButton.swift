//
//  OvalActionImageButton.swift
//  Mini Counter WatchKit Extension
//
//  Created by Daniel Arden on 03.11.2021.
//

import SwiftUI

struct OvalActionImageButton: View {
    @Environment(\.isEnabled) private var isEnabled: Bool

    let systemImageName: String
    let buttonColor: Color
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(systemName: systemImageName)
                .resizable()
                .foregroundColor(Color.white)
                .aspectRatio(1.0, contentMode: ContentMode.fit)
                .padding()
        }
        .buttonStyle(OvalButtonStyle(buttonColor: buttonColor))
        .opacity(!isEnabled ? 0.3 : 1.0)
        .padding([Edge.Set.top, Edge.Set.bottom], 1)
    }
}
