//
//  View+Center.swift
//  mini-counter WatchKit Extension
//
//  Created by Daniel Arden on 18.12.2021.
//

import SwiftUI

struct Center: ViewModifier {
    let axis: Axis

    func body(content: Content) -> some View {
        switch axis {
        case .horizontal:
            HStack {
                Spacer()

                content

                Spacer()
            }
        case .vertical:
            VStack {
                Spacer()

                content

                Spacer()
            }
        }
    }
}

extension View {
    func center(_ axis: Axis) -> some View {
        modifier(Center(axis: axis))
    }
}
