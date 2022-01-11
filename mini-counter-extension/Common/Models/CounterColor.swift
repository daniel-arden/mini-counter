//
//  CounterColor.swift
//  Mini Counter WatchKit Extension
//
//  Created by Daniel Arden on 17.11.2021.
//

import SwiftUI

// Thanks to Nick for help here :)
enum CounterColor: String, CaseIterable, Identifiable {
    case white
    case blueAtmosphere
    case grayAsh
    case greenSourCandy
    case orangeFire
    case purpleMedium
    case redRage
    case yellowDanger

    var color: Color {
        switch self {
        case .white:
            return .white
        case .blueAtmosphere:
            return .blueAtmosphere
        case .grayAsh:
            return .grayAsh
        case .greenSourCandy:
            return .greenSourCandy
        case .orangeFire:
            return .orangeFire
        case .purpleMedium:
            return .purpleMedium
        case .redRage:
            return .redRage
        case .yellowDanger:
            return .yellowDanger
        }
    }

    var id: String {
        rawValue
    }

    var name: String {
        switch self {
        case .white:
            return LocString.counterColorWhiteName()
        case .blueAtmosphere:
            return LocString.counterColorBlueAtmosphereName()
        case .grayAsh:
            return LocString.counterColorGrayAshName()
        case .greenSourCandy:
            return LocString.counterColorGreenSourCandyName()
        case .orangeFire:
            return LocString.counterColorOrangeFireName()
        case .purpleMedium:
            return LocString.counterColorPurpleMediumName()
        case .redRage:
            return LocString.counterColorRedRageName()
        case .yellowDanger:
            return LocString.counterColorYellowDangerName()
        }
    }
}
