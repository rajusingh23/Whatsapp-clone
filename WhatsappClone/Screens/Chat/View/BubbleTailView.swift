//
//  BubbleTailView.swift
//  WhatsappClone
//
//  Created by Raju Singh on 01/07/25.
//

import SwiftUI

struct BubbleTailView: View {
    var direction : MessageDirection
    
    private var backGroundColor: Color {
        return direction == .received ? .bubbleWhite : .bubbleGreen
    }
    
    var body: some View {
        Image(direction == .sent ? .outgoingTail : .incomingTail)
            .renderingMode(.template)
            .resizable()
            .frame(width: 10, height: 10)
            .offset(y: 3)
            .foregroundStyle(backGroundColor)
    }
    
}

#Preview {
    ScrollView {
        BubbleTailView(direction: .sent)
        BubbleTailView(direction: .received)
    }
    .frame(maxWidth: .infinity)
    .background(Color.gray.opacity(0.3))
}
