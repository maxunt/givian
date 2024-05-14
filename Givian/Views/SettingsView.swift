//
//  SettingsView.swift
//  Givian
//
//  Created by Max U on 4/28/24.
//

import SwiftUI

struct SettingsView: View {
    @State private var isSignedOut = false
    var body: some View {
        Text("Settings")
        Button(action: {
            SignOut()
        }, label: {
            ZStack {
                RoundedRectangle(cornerRadius: 15, style: .continuous)
                    .foregroundStyle(.blue)
                    .frame(width: 150, height: 50)
                Text("Sign Out")
                    .foregroundColor(Color.white)
            }.offset(CGSize(width: 0, height: 30))
        })
        .navigationDestination(isPresented: $isSignedOut) {
            ContentView()
                .navigationBarBackButtonHidden(true)
        }
    }
    
    func SignOut() {
        Task {
            do {
                try LocalUser.shared.SignOut()
                isSignedOut = true
            } catch {
                NSLog("Error signing out: \(error.localizedDescription)")
            }
        }
    }
}

#Preview {
    SettingsView()
}
