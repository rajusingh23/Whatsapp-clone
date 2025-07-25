//
//  AuthProvider.swift
//  WhatsappClone
//
//  Created by Raju Singh on 09/07/25.
//

import Foundation
import Combine
import FirebaseAuth
import FirebaseDatabase

enum AuthState {
    case pending, loggedIn(UserItem), loggedOut
}

protocol AuthProvider {
    static var shared: AuthProvider { get }
    var authState: CurrentValueSubject<AuthState, Never> { get }
    func autoLogin() async
    
    func login(email: String, and password: String) async throws
    func createAccount(for username: String, with email: String, and password: String) async throws
    func logOut() async throws
}
enum AuthError: Error {
    case accountCreationFailed(_ description: String)
    case failedToSaveUserInfo(_ description: String)
}

extension AuthError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .accountCreationFailed(let description):
            return description
        case .failedToSaveUserInfo(let description):
            return description
        }
    }
}
final class AuthManager: AuthProvider {
    private init () {
        Task { await autoLogin() }
    }
    
    static let shared: AuthProvider = AuthManager()
    
    var authState = CurrentValueSubject<AuthState, Never>(.pending)
    
    func autoLogin() async {
        if Auth.auth().currentUser == nil {
            authState.send(.loggedOut)
        } else {
            fetchCurrentUserInfo()
        }
    }
    
    func login(email: String, and password: String) async throws {
    
    }
    
    func createAccount(for username: String, with email: String, and password: String) async throws {
        //invoke firebase create account method: store the user in our firebase auth
        
        //store the new user info in our database
        do {
            let authResult = try await Auth.auth().createUser(withEmail: email, password: password)
            let uid = authResult.user.uid
            let newUser = UserItem(uid: uid, username: username, email: email)
            try await saveUserInfoDatabase(user: newUser)
            self.authState.send(.loggedIn(newUser))
        } catch {
            print("Failed to create an Account \(error.localizedDescription)")
            throw AuthError.accountCreationFailed(error.localizedDescription)
        }
    }
    
    func logOut() async throws {
        
    }
}

extension AuthManager {
    private func saveUserInfoDatabase(user: UserItem) async throws {
        do {
            let userDictionary = ["uid" : user.uid, "username": user.username, "email": user.email]
            
            try await Database.database().reference().child("users").child(user.uid).setValue(userDictionary)
        } catch {
            print("Failed to save created user info to the database \(error.localizedDescription)")
            throw AuthError.failedToSaveUserInfo(error.localizedDescription)
        }
    }
    
    private func fetchCurrentUserInfo () {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        Database.database().reference().child("users").child(currentUid).observe(.value){[weak self] snapshot in
            guard let userDict = snapshot.value as? [String: Any] else { return }
            let loggedInUser = UserItem(dictionary: userDict)
            self?.authState.send(.loggedIn(loggedInUser))
            print(" User \(loggedInUser.username) is logged in")
        } withCancel: { error in
            print("Failed to get current user info")
        }

    }
}

struct UserItem: Identifiable, Hashable, Decodable {
    let uid: String
    let username: String
    let email: String
    var bio: String? = nil
    var profileImageUrl : String? = nil
    
    var id: String {
        return uid
    }
    
    var bioUnwrapped: String {
        return bio ?? "Hey there i am using whatsapp"
    }
}
    
    extension UserItem {
        init(dictionary: [String: Any]) {
            self.uid = dictionary[.uid] as? String ?? ""
            self.username = dictionary[.username] as? String ?? ""
            self.email = dictionary[.email] as? String ?? ""
            self.bio = dictionary[.bio] as? String? ?? nil
            self.profileImageUrl = dictionary[.profileImageUrl] as? String? ?? nil
        }
    }
    
    extension String {
        static let uid = "uid"
        static let username = "username"
        static let email = "email"
        static var bio = "bio"
        static var profileImageUrl = "profileImageUrl"
    }

