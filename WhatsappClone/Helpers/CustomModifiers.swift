//
//  CustomModifiers.swift
//  WhatsappClone
//
//  Created by Raju Singh on 01/07/25.
//

import Foundation
import SwiftUI

private struct BubbleTailModifiers: ViewModifier {
    var direction: MessageDirection
    
    func body(content: Content) -> some View {
        content.overlay(alignment: direction == .received ? .bottomLeading : .bottomTrailing) {
            BubbleTailView(direction: direction)
        }
    }
}

extension View {
    func applyTail(_ direction: MessageDirection) -> some View {
        self.modifier(BubbleTailModifiers(direction: direction))
    }
}
