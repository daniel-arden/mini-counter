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
            return Color.white
        case .blueAtmosphere:
            return Color.blueAtmosphere
        case .grayAsh:
            return Color.grayAsh
        case .greenSourCandy:
            return Color.greenSourCandy
        case .orangeFire:
            return Color.orangeFire
        case .purpleMedium:
            return Color.purpleMedium
        case .redRage:
            return Color.redRage
        case .yellowDanger:
            return Color.yellowDanger
        }
    }
    
    var id: String {
        self.rawValue
    }
}
