//
//  BubbleImageView .swift
//  WhatsappClone
//
//  Created by Raju Singh on 03/07/25.
//

import SwiftUI

struct BubbleImageView: View {
    let item: MessageItem
    
    var body: some View {
        HStack {
            if item.direction == .sent { Spacer() }
            HStack {
                if item.direction == .sent { shareButton() }
                
                messageTextView()
                    .shadow(color: Color(.systemGray3).opacity(0.1), radius: 5, x: 0, y: 20)
                    .overlay {
                        playButton()
                            .opacity(item.type == .video ? 1 : 0)
                    }
                
                if item.direction == .received { shareButton() }


            }
            if item.direction == .received { Spacer() }

        }
    }
    
    private func playButton() -> some View {
        Image(systemName: "play.fill")
            .padding()
            .imageScale(.large)
            .foregroundStyle(.gray)
            .background(.thinMaterial)
            .clipShape(Circle())
    }
    private func messageTextView() -> some View {
        VStack(alignment: .leading, spacing: 0) {
            Image(.stubImage0)
                .resizable()
                .scaledToFill()
                .frame(width: 220,height: 180)
                .clipShape(
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                )
                .background {
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(Color(.systemGray5))
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .stroke(Color(.systemGray5))
                )
                .padding(5)
                .overlay(alignment: .bottomTrailing) {
                    timeStampTextView()
                }
            Text(item.text)
                .padding([.horizontal,.bottom],8)
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(width: 200)
        }
        .background(item.backGroundCOlor)
        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
        .applyTail(item.direction)
    }
    private func shareButton() -> some View {
        Button{
            
        }label: {
            Image(systemName: "arrowshape.turn.up.right.fill")
                .padding(10)
                .foregroundStyle(.white)
                .background(Color.gray)
                .background(.thinMaterial)
                .clipShape(Circle())
        }
    }
    
    private func timeStampTextView() -> some View {
        HStack {
            Text("11:13 AM")
                .font(.system(size: 12))
            
            if item.direction == .sent {
                Image(.seen)
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 16, height: 15)
                
            }
        }
        .padding(.vertical, 2.5)
        .padding(.horizontal, 8)
        .foregroundStyle(.white)
        .background(Color(.systemGray2))
        .clipShape(Capsule())
        .padding(12)
    }
    
}

#Preview {
    ScrollView {
        BubbleImageView(item: .receivedplaceholder)
        BubbleImageView(item: .sentplaceholder)
    }
    .frame(maxWidth: .infinity)
    .padding(.horizontal)
    .background(Color.gray.opacity(0.4))
}

