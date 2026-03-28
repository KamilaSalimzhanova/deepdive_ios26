//
//  TopicCardView.swift
//  SwiftUIBasics
//
//  Created by kamila on 28.03.2026.
//

import Foundation
import SwiftUI

struct TopicCardView: View {
    let title: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white)
                .shadow(radius: 5)
            HStack {
                Text(title)
                    .font(.headline)
                    .foregroundStyle(.black)
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundStyle(.gray)
            }
            .padding()
        }
        .frame(height: 80)
    }
}

#Preview {
    TopicCardView(title: "Simple view")
}
