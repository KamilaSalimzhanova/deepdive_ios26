//
//  MessagesView.swift
//  GreetingsApp
//
//  Created by kamila on 24.03.2026.
//

import SwiftUI

struct MessagesView: View {
    let messages: [DataItemModel] = [
        .init(text: "Hello there!", color: .myGreen),
        .init(text: "Welcome to swift programming", color: .myGray),
        .init(text: "Are u ready to,", color: .myYellow),
        .init(text: "start exploring", color: .myRed),
        .init(text: "Boom.", color: .myPurple)
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(messages) { message in
                TextView(text: message.text, textColor: message.color)
            }
        }
    }
}

#Preview {
    MessagesView()
}
