//
//  OvalActionButtonImage.swift
//  Mini Counter WatchKit Extension
//
//  Created by Daniel Arden on 10.11.2021.
//

import SwiftUI

struct OvalActionButtonImage: View {
    let systemImageName: String

    var body: some View {
        Image(systemName: systemImageName)
            .resizable()
            .foregroundColor(Color.white)
            .aspectRatio(1.0, contentMode: ContentMode.fit)
            .padding()
    }
}

// MARK: - Preview

#if DEBUG
    struct OvalActionButtonImage_Previews: PreviewProvider {
        static var previews: some View {
            OvalActionButtonImage(systemImageName: "gearshape.fill")
        }
    }
#endif
