//
//  BubbleTextView.swift
//  WhatsappClone
//
//  Created by Raju Singh on 01/07/25.
//

import SwiftUI

struct BubbleTextView: View {
    let item: MessageItem
    var body: some View {
        VStack(alignment: item.horizontalAlignment, spacing: 3) {
            Text("Hello, World! How are you Doing")
                .padding(10)
                .background(item.backGroundCOlor)
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                .applyTail(item.direction)
            
            timeStampTextView()
        }
        .shadow(color: Color(.systemGray3).opacity(0.1), radius: 5, x: 0, y: 20)
        .frame(maxWidth: .infinity, alignment: item.alignment)
        .padding(.leading, item.direction == .received ? 5 : 100)
        .padding(.trailing, item.direction == .received ? 100 : 5)
    }
    
    private func timeStampTextView() -> some View {
        HStack {
            Text("3:05 PM")
                .font(.system(size: 13))
                .foregroundStyle(.gray)
            
            if item.direction == .sent {
                Image(.seen)
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 15, height: 15)
                    .foregroundStyle(Color(.systemBlue))
                
            }
        }
    }
}

#Preview {
    ScrollView {
        BubbleTextView(item: .sentplaceholder)
        BubbleTextView(item: .receivedplaceholder)
    }.frame(maxWidth: .infinity)
        .background(.gray.opacity(0.4))
}
