//
//  DataItemModel.swift
//  GreetingsApp
//
//  Created by kamila on 24.03.2026.
//

import SwiftUI

struct DataItemModel: Identifiable { 
    let id = UUID()
    
    let text: String
    let color: Color
}
