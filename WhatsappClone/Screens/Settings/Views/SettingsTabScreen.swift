//
//  SettingsTabScreen.swift
//  WhatsappClone
//
//  Created by Raju Singh on 19/06/25.
//

import SwiftUI

struct SettingsTabScreen: View {
    @State private var searchText = ""
    var body: some View {
        NavigationStack{
            List{
                SettigsHeaderView()
                Section {
                    SeetingsItemView(item: .broadCastLists)
                    SeetingsItemView(item: .starredMessages)
                    SeetingsItemView(item: .linkedDevices)
                }
                Section {
                    SeetingsItemView(item: .account)
                    SeetingsItemView(item: .privacy)
                    SeetingsItemView(item: .chats)
                    SeetingsItemView(item: .notifications)
                    SeetingsItemView(item: .storage)
                }
                Section {
                    SeetingsItemView(item: .help)
                    SeetingsItemView(item: .tellFriend)
                }
                
            }
            .navigationTitle("Settings")
            .searchable(text: $searchText)
        }
    }
}

private struct SettigsHeaderView: View {
    var body: some View {
        HStack{
            Circle()
                .frame(width:55 ,height: 55)
            
            userInfoTextView()
            
        }
    }
    private func userInfoTextView() -> some View {
        VStack(alignment:.leading, spacing: 0) {
            HStack{
                Text("Qa User 13")
                    .font(.title2)
                
                Spacer()
                
                Image(.qrcode)
                    .renderingMode(.template)
                    .padding(5)
                    .foregroundStyle(.blue)
                    .background(Color(.systemGray5))
                    .clipShape(Circle())
                
            }
            Text("Hey there! I am using WhatsApp")
                .foregroundStyle(.gray)
                .font(.system(size: 15))
        }
        .lineLimit(1)
    }
    
}

#Preview {
    SettingsTabScreen()
}
