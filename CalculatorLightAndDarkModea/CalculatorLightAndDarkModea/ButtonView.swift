//
//  ButtonView.swift
//  CalculatorLightAndDarkModea
//
//  Created by kamila on 21.04.2026.
//

import SwiftUI

struct ButtonView: View {
    let calcButton: CalcButton
    let fgColor: Color
    let bgColor: Color
    var systemImage: String? {
        calcButton.rawValue.contains("IMG") ?
        calcButton.rawValue.replacingOccurrences(of: "IMG", with: "")
        : nil
    }
    var text: String? {
        calcButton.rawValue.contains("IMG") ?
        nil
        : calcButton.rawValue
    }
    
    let buttonDim: CGFloat = UIScreen.main.bounds.width / 5
    
    var body: some View {
        ZStack {
            Text(text ?? "")
            Image(systemName: systemImage ?? "")
        }
        .font(.title2)
        .fontWeight(.semibold)
        .frame(width: buttonDim, height: buttonDim)
        .foregroundStyle(fgColor)
        .background(bgColor)
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .overlay (
            RoundedRectangle(cornerRadius: 15)
                .stroke(bgColor, lineWidth: 1)
        )
    }
}

#Preview {
    ButtonView(
        calcButton: .negative,
        fgColor: foregroundDigitsColor,
        bgColor: buttonBackgroundColor
    )
}
