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
                    Font.system(
                        size: 70,
                        weight: Font.Weight.bold,
                        design: Font.Design.monospaced
                    )
                )
                .foregroundColor(saveDetailStore.counterColor.color)
                .padding(Edge.Set.vertical)
            
            Divider()
                .padding()
            
            Text("What were you keeping track of? (optional)")
                .font(
                    Font.system(
                        Font.TextStyle.body
                    )
                )
                .padding(Edge.Set.vertical)
            
            TextField("Count description", text: $saveDetailStore.description)
                .padding(Edge.Set.vertical)
            
            OvalActionButton(title: "SAVE", buttonColor: Color.greenSourCandy) {
                saveDetailStore.saveCount()
                mainStore.resetCounterPublisher.send()
                mainStore.selectTabIndexPublisher.send(1)
                saveDetailRouter.dismissCoordinator()
            }
            .padding(Edge.Set.top)
            
        }
        .headerProminence(Prominence.increased)
        .navigationTitle("Save count")
        .navigationBarTitleDisplayMode(NavigationBarItem.TitleDisplayMode.large)
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
