//
//  UserViewModel.swift
//  DataFlowSwiftUI
//
//  Created by kamila on 30.03.2026.
//

import Foundation
import Combine

final class UserViewModel: ObservableObject {
    @Published var username: String = "Default Name"
}
