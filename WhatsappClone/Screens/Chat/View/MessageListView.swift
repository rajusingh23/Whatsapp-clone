//
//  MessageListView.swift
//  WhatsappClone
//
//  Created by Raju Singh on 30/06/25.
//

import SwiftUI

struct MessageListView: UIViewControllerRepresentable {
    typealias UIViewControllerType = MessageListController

    func makeUIViewController(context: Context) -> MessageListController {
        let messageListController = MessageListController()
        return messageListController
    }
    
    func updateUIViewController(_ uiViewController: MessageListController, context: Context) { }
    
}

#Preview {
    MessageListView()
}
