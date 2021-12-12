//
//  EditDescriptionView.swift
//  mini-counter WatchKit Extension
//
//  Created by Daniel Arden on 12.12.2021.
//

import SwiftUI

struct EditDescriptionView: View {
    let countEntry: CountEntry

    var body: some View {
        Text("EditDescriptionView")
    }
}

// MARK: - Preview

#if DEBUG
    struct EditDescriptionView_Previews: PreviewProvider {
        static var previews: some View {
            EditDescriptionView(countEntry: .mockData[1])
        }
    }
#endif
