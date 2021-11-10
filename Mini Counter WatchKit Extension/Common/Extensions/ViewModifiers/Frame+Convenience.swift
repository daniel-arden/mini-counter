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
            .frame(maxWidth: CGFloat.infinity)
    }
}

struct MaxHeight: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxHeight: CGFloat.infinity)
    }
}

struct MaxFrame: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(
                maxWidth: CGFloat.infinity,
                maxHeight: CGFloat.infinity
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
}
