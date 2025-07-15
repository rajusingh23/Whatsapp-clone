//
//  ChatRoomScreen.swift
//  WhatsappClone
//
//  Created by Raju Singh on 20/06/25.
//

import SwiftUI

struct ChatRoomScreen: View {
    
    var body: some View {
        MessageListView()
        .toolbar(.hidden, for: .tabBar)
        .toolbar {
            leadingNavItems()
            trailingNavItems()
        }
        .navigationBarTitleDisplayMode(.inline)
        .safeAreaInset(edge: .bottom) {
            TextInputArea()
        }
    }
    
}

extension ChatRoomScreen {
    @ToolbarContentBuilder
    private func leadingNavItems() -> some ToolbarContent {
        ToolbarItem(placement: .topBarLeading) {
            HStack{
                Circle()
                    .frame(width: 35,height: 30)
                
                Text("QaUser12")
                    .bold()
            }
        }
    }
    
    @ToolbarContentBuilder
    private func trailingNavItems() -> some ToolbarContent {
        ToolbarItemGroup(placement: .topBarTrailing) {
            
            Button{
                
            }label: {
                Image(systemName: "video")
            }
            
            Button{
                
            }label: {
                Image(systemName: "phone")
            }
            
        }
    }
}

#Preview {
    NavigationStack{
        ChatRoomScreen()
    }
}
