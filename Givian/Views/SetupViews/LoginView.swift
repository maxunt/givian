//
//  LoginView.swift
//  Givian
//
//  Created by Max U on 4/28/24.
//

import SwiftUI

struct LoginView: View {
    @State var email: String = ""
    @State var password: String = ""
    var body: some View {
        VStack {
            Text("Login")
            TextField(
                "email",
                text: $email
            )
            .border(.secondary)
            .padding(10)
            SecureField(
                "password",
                text: $password
            )
            .border(.secondary)
            .padding(10)
            
            Button(action: {
                Login()
            }, label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                        .foregroundStyle(.blue)
                        .frame(width: 150, height: 50)
                    Text("Login")
                        .foregroundColor(Color.white)
                }.offset(CGSize(width: 0, height: 30))
            })
            
            NavigationLink {
                SignUpView()
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                        .strokeBorder(Color.black, lineWidth: 1)
                        .foregroundStyle(.white)
                        .frame(width: 150, height: 50)
                    Text("SignUp")
                        .foregroundColor(Color.black)
                }.offset(CGSize(width: 0, height: 30))
            }
        }
        
    }
    
    func Login() {
        Task {
            do {
                try await LocalUser.shared.Login(username: email, password: password)
            } catch {
                NSLog("SignUp Error: \(error.localizedDescription)")
            }
        }
    }
}


#Preview {
    LoginView()
}
