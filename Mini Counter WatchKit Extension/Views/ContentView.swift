//
//  ContentView.swift
//  Mini Counter WatchKit Extension
//
//  Created by Daniel Arden on 03.11.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Int = 1

    var body: some View {
        TabView(selection: $selection) {
            ActionsView()
                .tag(0)
            CounterView()
                .tag(1)
            ListView()
                .tag(2)
        }
        .tabViewStyle(PageTabViewStyle.page)
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
