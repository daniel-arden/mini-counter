//
//  ActionsView.swift
//  Mini Counter WatchKit Extension
//
//  Created by Daniel Arden on 03.11.2021.
//

import SwiftUI

struct ActionsView: View {
    var body: some View {
        VStack(spacing: 8) {
            HStack(spacing: 8) {
                OvalActionImageButton(
                    systemImageName: "gearshape.fill",
                    buttonColor: Color.pewterBlue
                ) {
                    print("Settings button tapped!")
                }

                OvalActionImageButton(
                    systemImageName: "arrow.clockwise.circle.fill",
                    buttonColor: Color.terraCotta
                ) {
                    print("Reset button tapped!")
                }
            }
            
            OvalActionButton(title: "Save Count", buttonColor: Color.pistachio) {
                print("Save Count button tapped!")
            }
        }
    }
}

// MARK: - Preview
#if DEBUG
struct ActionsView_Previews: PreviewProvider {
    static var previews: some View {
        ActionsView()
    }
}
#endif
