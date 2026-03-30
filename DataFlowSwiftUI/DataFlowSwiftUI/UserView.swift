//
//  UserView.swift
//  DataFlowSwiftUI
//
//  Created by kamila on 30.03.2026.
//

import SwiftUI

struct UserDataView: View {
    @EnvironmentObject var userVM: UserViewModel

    var body: some View {
        VStack {
            Text("Name: \(userVM.username)")
            TextField(text: $userVM.username) {
                Text("Enter your name:")
                    .padding()
                    .background(Color.blue.opacity(0.3))
            }
        }
        .navigationTitle("Enter name view")
    }
}

struct UserView: View {
    @EnvironmentObject var userVM: UserViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Hello, \(userVM.username)")
                    .font(.title)
                
                NavigationLink {
                    UserDataView()
                } label: {
                    Text("Update name")
                }
            }
            .padding()
            .navigationTitle("Main View")
        }
    }
}

#Preview {
    UserView()
        .environmentObject(UserViewModel())
}
