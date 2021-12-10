//
//  ColorDotView.swift
//  Mini Counter WatchKit Extension
//
//  Created by Daniel Arden on 14.11.2021.
//

import SwiftUI

struct ColorDotView: View {
    let counterColor: CounterColor
    @Binding var selectedColor: CounterColor

    var body: some View {
        GeometryReader { geometry in
            Button {
                guard selectedColor != counterColor else {
                    return
                }

                withAnimation(.easeInOut) {
                    selectedColor = counterColor
                }
            } label: {
                ZStack {
                    if $selectedColor.wrappedValue == counterColor {
                        Circle()
                            .stroke(lineWidth: geometry.size.height / 12.0)
                            .foregroundColor(counterColor.color)
                    }

                    Circle()
                        .fill(counterColor.color)
                        .padding(geometry.size.height / 10.0)
                }
            }
            .buttonStyle(.plain)
        }
        .padding(.horizontal, 1)
    }
}

// MARK: - Preview

#if DEBUG
    struct ColorDotView_Previews: PreviewProvider {
        static var previews: some View {
            ColorDotView(counterColor: .redRage, selectedColor: .constant(.purpleMedium))
                .squareFrame(48)
                .previewLayout(.sizeThatFits)

            ColorDotView(counterColor: .yellowDanger, selectedColor: .constant(.yellowDanger))
                .squareFrame(48)
                .previewLayout(.sizeThatFits)
        }
    }
#endif
