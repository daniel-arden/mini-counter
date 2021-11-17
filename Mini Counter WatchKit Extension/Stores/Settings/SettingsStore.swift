//
//  SettingsStore.swift
//  Mini Counter WatchKit Extension
//
//  Created by Daniel Arden on 13.11.2021.
//

import SwiftUI

final class SettingsStore: ObservableObject {
    @AppStorage(UserDefaults.Key.counterStride.rawValue) var counterStride: Int = Constants.defaultCounterStride
    @AppStorage(UserDefaults.Key.counterColor.rawValue) var counterColor: CounterColor = Constants.defaultCounterColor
    
    var isStrideAtLowerBound: Bool {
        counterStride == Constants.counterStrideRange.lowerBound
    }
    
    var isStringAtUpperBound: Bool {
        counterStride == Constants.counterStrideRange.upperBound
    }
}

// MARK: - Helpers
extension SettingsStore {
    func decrementStride() {
        guard counterStride > Constants.counterStrideRange.lowerBound else {
            return
        }
        
        counterStride -= 1
    }
    
    func incrementStride() {
        guard counterStride < Constants.counterStrideRange.upperBound else {
            return
        }
        
        counterStride += 1
    }
}
