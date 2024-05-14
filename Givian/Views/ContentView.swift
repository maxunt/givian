//
//  ContentView.swift
//  Givian
//
//  Created by Max U on 4/28/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var user: LocalUser = LocalUser.shared

    var body: some View {
        NavigationStack {
            if user.loggedInUser != nil {
                HomePageView()
            } else {
                LoginView()
            }
        }
    }
}

#Preview {
    ContentView()
}
