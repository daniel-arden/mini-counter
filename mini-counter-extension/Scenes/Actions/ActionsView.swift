//
//  ActionsView.swift
//  Mini Counter WatchKit Extension
//
//  Created by Daniel Arden on 03.11.2021.
//

import SwiftUI

struct ActionsView: View {
    // MARK: Stores

    @EnvironmentObject private var mainStore: MainStore
    @EnvironmentObject private var counterStore: CounterStore

    // MARK: Private Properties

    @State private var showResetCountAlert = false

    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                HStack(spacing: 8) {
                    NavigationLink {
                        SettingsView()
                    } label: {
                        Image(systemName: "gearshape.fill")
                            .resizable()
                            .aspectRatio(1.0, contentMode: .fit)
                    }
                    .buttonStyle(.bordered)
                    .tint(.blueAtmosphere.opacity(10))
                    .foregroundColor(.white)
                    .accessibilityLabel(LocString.actionsViewA11ySettingsTitle())

                    RoundedActionImageButton("arrow.clockwise.circle.fill", color: .orangeFire) {
                        showResetCountAlert.toggle()
                    }
                    .disabled(counterStore.counterValue == 0)
                    .accessibilityLabel(LocString.actionsViewA11yResetTitle())
                }
                .frame(maxHeight: 44)

                NavigationLink(LocString.buttonSaveCountTitle()) {
                    SaveDetailView()
                }
                .buttonStyle(.bordered)
                .tint(.greenSourCandy.opacity(10))
                .foregroundColor(.white)
                .frame(maxHeight: 44)
            }
            .alert(isPresented: $showResetCountAlert) {
                Alert(
                    title: Text(LocString.alertResetCounterTitle()),
                    message: Text(LocString.alertResetCounterCaption()),
                    primaryButton: .destructive(
                        Text(LocString.buttonResetTitle())
                    ) {
                        mainStore.selectTab(.counterView)
                        counterStore.resetCounter()
                        showResetCountAlert.toggle()
                    },
                    secondaryButton: .cancel(
                        Text(LocString.buttonCancelTitle())
                    ) {
                        showResetCountAlert.toggle()
                    }
                )
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
