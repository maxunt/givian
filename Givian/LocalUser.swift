//
//  User.swift
//  Givian
//
//  Created by Max U on 4/28/24.
//
import FirebaseAuth
import Foundation
class LocalUser: ObservableObject {
    static let shared = LocalUser()
    
    @Published var loggedInUser: User?
    var isLoggedIn: Bool {
        loggedInUser != nil
    }
    private init() {
        refreshCurrentUser()
        Auth.auth().addStateDidChangeListener { auth, user in
            NSLog("Auth Change for User: \(String(describing: user))")
            self.refreshCurrentUser()
        }
    }
    
    func SignUp(username: String, password: String) async throws {
        NSLog("SignUp: \(username)")
        try await Auth.auth().createUser(withEmail: username, password: password)
    }
    
    func Login(username: String, password: String) async throws {
        NSLog("Login: \(username)")
        try await Auth.auth().signIn(withEmail: username, password: password)
    }
    
    func SignOut() throws {
        NSLog("SignOut")
        try Auth.auth().signOut()
    }
    
    // Check auth to see if there is a current user
    func refreshCurrentUser() {
        DispatchQueue.main.async {
            self.loggedInUser = Auth.auth().currentUser
            NSLog("RefreshCurrentUser: \(String(describing: self.loggedInUser))")
        }
    }
}
