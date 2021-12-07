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
    @State private var showResetCountAlert: Bool = false
    
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
                    OvalActionImageButton(
                        systemImageName: "gearshape.fill",
                        buttonColor: Color.blueAtmosphere,
                        style: OvalButtonStyle.Style.nonScrollingView
                    ) {
                        actionsRouter.route(to: \.settings)
                    }

                    OvalActionImageButton(
                        systemImageName: "arrow.clockwise.circle.fill",
                        buttonColor: Color.orangeFire,
                        style: OvalButtonStyle.Style.nonScrollingView
                    ) {
                        showResetCountAlert = true
                    }
                }

                OvalActionButton(
                    title: "Save Count",
                    buttonColor: Color.greenSourCandy,
                    style: OvalButtonStyle.Style.nonScrollingView
                ) {
                    actionsRouter.route(to: \.saveDetail)
                }
            }
            .alert(isPresented: $showResetCountAlert) {
                Alert(
                    title: Text("Reset Counter"),
                    message: Text("Are you sure you want to reset the counter to zero?\n\nThis action cannot be undone."),
                    primaryButton: Alert.Button.destructive(Text("RESET")) {
                        mainStore.selectTabIndexPublisher.send(1)
                        counterStore.resetCounter()
                        showResetCountAlert = false
                    },
                    secondaryButton: Alert.Button.cancel(Text("CANCEL")) {
                        showResetCountAlert = false
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
