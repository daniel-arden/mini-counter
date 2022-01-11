//
//  SaveDetailView.swift
//  Mini Counter WatchKit Extension
//
//  Created by Daniel Arden on 13.11.2021.
//

import SwiftUI

struct SaveDetailView: View {
    // MARK: Stores

    @EnvironmentObject private var mainStore: MainStore
    @EnvironmentObject private var counterStore: CounterStore

    // MARK: Private Properties

    @Environment(\.dismiss) private var dismiss
    @State private var countLabel = ""

    var body: some View {
        ScrollView {
            Text("\(counterStore.counterValue.roundedInt)")
                .font(
                    .system(
                        size: 70,
                        weight: .bold,
                        design: .monospaced
                    )
                )
                .foregroundColor(counterStore.counterColor.color)
                .padding(.vertical)
                .accessibilityLabel(
                    LocString.saveDetailViewA11yCurrentCountLabel(
                        counterStore.counterValue.roundedInt
                    )
                )

            Divider()
                .padding()

            Text(LocString.saveDetailViewKeepingTrackOf())
                .font(.system(.body))
                .padding(.vertical)

            TextField(
                LocString.saveDetailViewCountDescription(),
                text: $countLabel
            )
            .padding(.vertical)

            RoundedActionButton(LocString.buttonSaveTitle(), color: .greenSourCandy) {
                mainStore.saveCounterCount(
                    counterStore.counterValue.roundedInt,
                    label: countLabel
                )
                mainStore.resetCounterPublisher.send()
                dismiss()
            }
            .padding(.top)
        }
        .onLoad {
            countLabel = counterStore.counterLabel
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
            SaveDetailView()
        }
    }
#endif
