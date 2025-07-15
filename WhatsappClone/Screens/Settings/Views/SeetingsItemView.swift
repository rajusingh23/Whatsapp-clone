//
//  SeetingsItemView.swift
//  WhatsappClone
//
//  Created by Raju Singh on 19/06/25.
//

import SwiftUI

struct SeetingsItemView: View {
    let item: SettingsItem
    
    var body: some View {
        HStack{
            iconImageView()
                .frame(width: 30, height: 30)
                .padding(3)
                .foregroundColor(.white)
                .background(item.backgroundColor)
                .clipShape(RoundedRectangle(cornerRadius: 5, style: .continuous))
            
            
            Text(item.title)
                .font(.system(size: 19))
            
            Spacer()
        }
    }
    @ViewBuilder
    private func iconImageView() -> some View {
        switch item.imageType {
        case .systemImage:
            Image(systemName: item.imageName)
                .bold()
                .font(.callout)
            
        case .assetImage:
            Image(item.imageName)
                .renderingMode(.template)
                .padding(3)
        }
        
    }
}

#Preview {
    SeetingsItemView(item: .chats)
}
