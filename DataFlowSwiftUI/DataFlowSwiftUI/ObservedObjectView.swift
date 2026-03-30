//
//  ObservedObjectView.swift
//  DataFlowSwiftUI
//
//  Created by kamila on 30.03.2026.
//

import SwiftUI
import Combine

class SomeViewModel: ObservableObject {
    @Published var data1: String = "hello world1"
    @Published var data2: String = "hello world2"
}

struct ObservedObjectView: View {
    @StateObject var vM = SomeViewModel()
    
    var body: some View {
        VStack {
            Text(vM.data1)
            Text(vM.data2)
            
            Button {
                vM.data1 = "new data1"
                vM.data2 = "new data2"
            } label: {
                Text("Click me")
            }

        }
        .font(.largeTitle)
        .padding()
    }
}

#Preview {
    ObservedObjectView()
}
