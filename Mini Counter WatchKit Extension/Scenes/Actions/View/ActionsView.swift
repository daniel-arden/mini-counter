//
//  ActionsView.swift
//  Mini Counter WatchKit Extension
//
//  Created by Daniel Arden on 03.11.2021.
//

import SwiftUI

struct ActionsView: View {
    // MARK: Stores

    @ObservedObject private var mainStore: MainStore
    @ObservedObject private var counterStore: CounterStore

    // MARK: Private Properties

    @EnvironmentObject private var actionsRouter: ActionsCoordinator.Router
    @State private var showResetCountAlert = false

    // MARK: Init

    init(
        mainStore: MainStore,
        counterStore: CounterStore
    ) {
        self.mainStore = mainStore
        self.counterStore = counterStore
    }

    var body: some View {
        NavigationView {
            VStack(spacing: 8) {
                HStack(spacing: 8) {
                    RoundedActionImageButton("gearshape.fill", color: .blueAtmosphere) {
                        actionsRouter.route(to: \.settings)
                    }
                    .frame(maxHeight: 44)

                    RoundedActionImageButton("arrow.clockwise.circle.fill", color: .orangeFire) {
                        showResetCountAlert.toggle()
                    }
                    .frame(maxHeight: 44)
                }

                RoundedActionButton("Save Count", color: .greenSourCandy) {
                    actionsRouter.route(to: \.saveDetail)
                }
            }
            .alert(isPresented: $showResetCountAlert) {
                Alert(
                    title: Text("Reset Counter"),
                    message: Text("Are you sure you want to reset the counter to zero?\n\nThis action cannot be undone."),
                    primaryButton: .destructive(Text("RESET")) {
                        mainStore.selectTabIndexPublisher.send(1)
                        counterStore.resetCounter()
                        showResetCountAlert.toggle()
                    },
                    secondaryButton: .cancel(Text("CANCEL")) {
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
            ActionsView(
                mainStore: .init(),
                counterStore: .init()
            )
        }
    }
#endif
