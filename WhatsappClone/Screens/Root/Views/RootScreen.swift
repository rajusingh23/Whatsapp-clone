//
//  RootScreen.swift
//  WhatsappClone
//
//  Created by Raju Singh on 14/07/25.
//

import SwiftUI

struct RootScreen: View {
    @StateObject private var viewModel = RootScreenModel()
    
    var body: some View {
        switch viewModel.authState {
        case .pending:
            ProgressView()
                .controlSize(.large)
            
        case .loggedIn(let loggedInUser):
            MainTabView()
            
        case .loggedOut:
            LoginScreen()
        }
    }
}

#Preview {
    RootScreen()
}
