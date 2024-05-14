//
//  HomePageView.swift
//  Givian
//
//  Created by Max U on 4/28/24.
//

import SwiftUI

struct HomePageView: View {
    var body: some View {
        ZStack {
            // Header
            VStack {
                HStack {
                    NavigationLink {
                        SettingsView()
                    } label: {
                        Image(systemName: "gearshape")
                            .font(.system(size: 40, design: .rounded))
                            .foregroundColor(Color.black)
                            .padding(20)
                    }
                    Spacer()
                    NavigationLink {
                        NewMessageView()
                    } label: {
                        Image(systemName: "plus.message")
                            .font(.system(size: 40, design: .rounded))
                            .foregroundColor(Color.black)
                            .padding(20)
                    }
                }
                Spacer()
            }
            
            // Body
            Text("Homepage")
        }
    }
}

#Preview {
    HomePageView()
}
