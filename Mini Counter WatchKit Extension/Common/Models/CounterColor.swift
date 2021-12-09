//
//  CounterColor.swift
//  Mini Counter WatchKit Extension
//
//  Created by Daniel Arden on 17.11.2021.
//

import struct SwiftUI.Color

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
}
