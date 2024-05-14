//
//  SignUpView.swift
//  Givian
//
//  Created by Max U on 4/28/24.
//

import SwiftUI

struct SignUpView: View {
    @State var email: String = ""
    @State var password: String = ""
    var body: some View {
        VStack {
            Text("Sign Up")
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
                SignUp()
            }, label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                        .foregroundStyle(.blue)
                        .frame(width: 150, height: 50)
                    Text("Sign Up")
                        .foregroundColor(Color.white)
                }.offset(CGSize(width: 0, height: 30))
            })
        }
        
    }
    
    func SignUp() {
        Task {
            do {
                try await LocalUser.shared.SignUp(username: email, password: password)
            } catch {
                NSLog("SignUp Error: \(error.localizedDescription)")
            }
        }
    }
}

#Preview {
    SignUpView()
}
