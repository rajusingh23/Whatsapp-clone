//
//  AuthHeaderView.swift
//  WhatsappClone
//
//  Created by Raju Singh on 06/07/25.
//

import SwiftUI

struct AuthHeaderView: View {
    var body: some View {
        HStack {
            Image(.whatsapp)
                .resizable()
                .frame(width: 40, height: 40)
            
            Text("Whatsapp")
                .font(.largeTitle)
                .foregroundStyle(.white)
                .fontWeight(.semibold)
            
        }
    }
}

#Preview {
    AuthHeaderView()
}
