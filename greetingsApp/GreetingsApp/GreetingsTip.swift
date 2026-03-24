//
//  GreetingsTip.swift
//  GreetingsApp
//
//  Created by kamila on 24.03.2026.
//

import Foundation
import TipKit

struct GreetingsTip: Tip {
    var title: Text {
        Text("Click on Text")
    }
    
    var message: Text? {
        Text("Text will be randomly generated with an animation")
    }
    
    var asset: Image? {
        Image(systemName: "figure.walk.motion")
    }
}
