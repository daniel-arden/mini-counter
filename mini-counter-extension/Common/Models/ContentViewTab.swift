//
//  ContentViewTab.swift
//  mini-counter WatchKit Extension
//
//  Created by Daniel Arden on 23.12.2021.
//

import SwiftUI

/// Encapsulates tabs to be displayed in ContentView's TabView along with their indexes
enum ContentViewTab: Int, CaseIterable, Identifiable {
    case actionsView, counterView, savedEntryListView

    @ViewBuilder
    var view: some View {
        switch self {
        case .actionsView:
            ActionsView()
                .tag(rawValue)
        case .counterView:
            CounterView()
                .tag(rawValue)
        case .savedEntryListView:
            SavedEntryListView()
                .tag(rawValue)
        }
    }

    var id: Int {
        rawValue
    }
}
