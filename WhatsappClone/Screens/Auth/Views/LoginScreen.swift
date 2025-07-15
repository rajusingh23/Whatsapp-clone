//
//  LoginScreen.swift
//  WhatsappClone
//
//  Created by Raju Singh on 06/07/25.
//

import SwiftUI

struct LoginScreen: View {
    @StateObject private var authScreenModel = AuthScreenModel()
    var body: some View {
        NavigationStack {
            VStack {
                
                Spacer()
                AuthHeaderView()
                AuthTextField(type: .email, text: $authScreenModel.email)
                AuthTextField(type: .password, text: $authScreenModel.password)
                forgotPasswordButton()
                
                AuthButton(title : "Log in now") {
                    
                }
                .disabled(authScreenModel.disableLoginButton)
                
                Spacer()
                signUpButton()
                    .padding(.bottom, 30)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.teal.gradient)
            .ignoresSafeArea()
            .alert(isPresented: $authScreenModel.errorState.showError) {
                Alert(
                    title: Text(authScreenModel.errorState.errorMessage),
                    dismissButton: .default(Text("Ok"))
                )
            }
        }
    }
    private func forgotPasswordButton () -> some View {
        Button {
            
        } label: {
            Text("Forgort Password ?")
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.trailing, 32)
                .bold()
                .padding(.vertical)
        }
    }
    
    private func signUpButton() -> some View {
        NavigationLink {
            SignUpScreen(authScreenModel: authScreenModel)
        } label: {
            HStack{
                Image(systemName: "sparkles")
                (
                Text("Don't have an account ?")
                +
                Text(" Create One").bold()
                )
                Image(systemName: "sparkles")
            }
            .foregroundStyle(.white)
        }
    }
}

#Preview {
    LoginScreen()
}
