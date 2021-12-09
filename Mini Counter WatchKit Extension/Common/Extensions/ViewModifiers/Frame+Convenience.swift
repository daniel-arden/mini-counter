//
//  Frame+Convenience.swift
//  Mini Counter WatchKit Extension
//
//  Created by Daniel Arden on 03.11.2021.
//

import SwiftUI

struct MaxWidth: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
    }
}

struct MaxHeight: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxHeight: .infinity)
    }
}

struct MaxFrame: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity
            )
    }
}

struct SquareFrame: ViewModifier {
    let dimension: CGFloat

    func body(content: Content) -> some View {
        content
            .frame(
                width: dimension,
                height: dimension
            )
    }
}

extension View {
    func maxWidth() -> some View {
        modifier(MaxWidth())
    }

    func maxHeight() -> some View {
        modifier(MaxHeight())
    }

    func maxFrame() -> some View {
        modifier(MaxFrame())
    }
    
    func squareFrame(_ dimension: CGFloat) -> some View {
        modifier(SquareFrame(dimension: dimension))
    }
}
