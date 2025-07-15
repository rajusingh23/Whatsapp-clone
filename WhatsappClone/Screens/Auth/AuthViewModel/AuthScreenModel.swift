//
//  AuthScreenModel.swift
//  WhatsappClone
//
//  Created by Raju Singh on 07/07/25.
//

import Foundation
@MainActor
final class AuthScreenModel: ObservableObject {
    // Published properties
    
    @Published var isLoading = false
    @Published var email = ""
    @Published var password = ""
    @Published var username = ""
    @Published var errorState:(showError: Bool, errorMessage: String) = (false, "Uh oh")
    
    // Computed properties
    
    var disableLoginButton: Bool {
        return email.isEmpty || password.isEmpty || isLoading
    }
    
    var disableSignUpButton: Bool {
        return email.isEmpty || password.isEmpty || username.isEmpty || isLoading
    }
    func handleSignUp() async {
        isLoading = true
        do {
            try await AuthManager.shared.createAccount(for: username, with: email, and: password)
        } catch {
            errorState.errorMessage = "Failed to create an account \(error.localizedDescription)"
            errorState.showError = true
            isLoading = false
        }
    }
}




