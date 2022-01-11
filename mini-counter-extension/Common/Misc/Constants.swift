//
//  Constants.swift
//  Mini Counter WatchKit Extension
//
//  Created by Daniel Arden on 13.11.2021.
//

enum Constants {
    // MARK: Persistent Container

    static let persistentContainerName = "mini-counter"
    static let persistentContainerPath = "/dev/null"

    // MARK: Tabs

    static let defaultSelectedContentViewTabIndex = ContentViewTab.counterView.rawValue

    // MARK: Counter

    static let counterStrideRange = 1 ... 10
    static let counterValueRange = 0 ... 999
    static let defaultCounterStride = Constants.counterStrideRange.lowerBound
    static let defaultCounterColor = CounterColor.white
}
