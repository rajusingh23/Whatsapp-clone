//
//  MessageItem.swift
//  WhatsappClone
//
//  Created by Raju Singh on 01/07/25.
//

import SwiftUI

struct MessageItem : Identifiable {
    let id = UUID().uuidString
    let text: String
    let type: MessageType
    let direction: MessageDirection
    
    static let sentplaceholder = MessageItem(text: "Holi Spagetti", type: .text, direction: .sent)
    static let receivedplaceholder = MessageItem(text: "Holi Spagetti", type: .text, direction: .received)
    
    var alignment: Alignment {
        return direction == .received ? .leading : .trailing
    }
    
    var horizontalAlignment: HorizontalAlignment {
        return direction == .received ? .leading : .trailing
    }
    
    var backGroundCOlor: Color {
        return direction == .sent ? .bubbleGreen : .bubbleWhite
    }
    static let stubMessage: [MessageItem] = [
        MessageItem(text: "Hi there",type: .text, direction: .sent),
        MessageItem(text: "Hi there this is a photo",type: .photo, direction: .received),
        MessageItem(text: "Hi there this is a video",type: .video, direction: .sent),
        MessageItem(text: "",type: .audio, direction: .received)

    ]
}

enum MessageType {
    case text, photo, video, audio
}

enum MessageDirection {
    case sent, received
    
    static var random: MessageDirection{
        return [MessageDirection.sent, .received].randomElement() ?? .sent
    }
}
