//
//  SaveDetailView.swift
//  Mini Counter WatchKit Extension
//
//  Created by Daniel Arden on 13.11.2021.
//

import SwiftUI

struct SaveDetailView: View {
    // MARK: Stores

    @ObservedObject private var mainStore: MainStore
    @ObservedObject private var saveDetailStore: SaveDetailStore

    // MARK: - Private Properties

    @EnvironmentObject private var saveDetailRouter: SaveDetailCoordinator.Router

    // MARK: Init

    init(
        mainStore: MainStore,
        saveDetailStore: SaveDetailStore
    ) {
        self.mainStore = mainStore
        self.saveDetailStore = saveDetailStore
    }

    var body: some View {
        ScrollView {
            Text("\(saveDetailStore.counterCount)")
                .font(
                    .system(
                        size: 70,
                        weight: .bold,
                        design: .monospaced
                    )
                )
                .foregroundColor(saveDetailStore.counterColor.color)
                .padding(.vertical)

            Divider()
                .padding()

            Text(LocString.saveDetailViewKeepingTrackOf())
                .font(.system(.body))
                .padding(.vertical)

            TextField(
                LocString.saveDetailViewCountDescription(),
                text: $saveDetailStore.description
            )
            .padding(.vertical)

            RoundedActionButton(LocString.buttonSaveTitle(), color: .greenSourCandy) {
                saveDetailStore.saveCount()
                mainStore.resetCounterPublisher.send()
                mainStore.selectTabIndexPublisher.send(1)
                saveDetailRouter.dismissCoordinator()
            }
            .padding(.top)
        }
        .headerProminence(.increased)
        .navigationTitle(LocString.saveDetailViewNavigationTitle())
        .navigationBarTitleDisplayMode(.large)
    }
}

// MARK: - Preview

#if DEBUG
    struct SaveDetailView_Previews: PreviewProvider {
        static var previews: some View {
            SaveDetailView(
                mainStore: .init(),
                saveDetailStore: .init(
                    mainStore: .init(),
                    counterCount: 999
                )
            )
        }
    }
#endif
