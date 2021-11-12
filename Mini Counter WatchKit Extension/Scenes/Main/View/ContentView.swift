//
//  ContentView.swift
//  Mini Counter WatchKit Extension
//
//  Created by Daniel Arden on 03.11.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        MainTabCoordinator().view()
    }
}

// MARK: - Preview

#if DEBUG
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
#endif
