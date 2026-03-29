//
//  BuyNowVoew.swift
//  ExecrisesSwiftUI
//
//  Created by kamila on 29.03.2026.
//

import SwiftUI

struct BuyNowView: View {
    var discount: Double? {
        if let discountPercentage {
            return price * Double(100 - discountPercentage) / 100
        }
        
        return nil
    }
    let price: Double
    let discountPercentage: Int?
    let discountColor: Color
    let bgColor: Color
    let yOffset: Double
    let discountAngle: Double
    
    init(
        price: Double,
        discountPercentage: Int? = nil,
        discountColor: Color = .blue,
        bgColor: Color = .red,
        yOffset: Double = -20,
        discountAngle: Double = -10
    ) {
        self.price = price
        self.discountPercentage = discountPercentage
        self.discountColor = discountColor
        self.bgColor = bgColor
        self.yOffset = yOffset
        self.discountAngle = discountAngle
    }
    
    var body: some View {
        VStack {
            if let discountPercentage {
                Text("\(discountPercentage)% OFF")
                    .foregroundStyle(.white)
                    .padding()
                    .background(discountColor)
                    .fontWeight(.semibold)
                    .clipShape(.rect(cornerRadius: 15))
                    .rotationEffect(Angle(degrees: discountAngle))
                    .offset(y: yOffset)
                    .shadow(radius: 5)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            
            HStack {
                Text("Buy Now")
                    .font(.title)
                    .bold()
                Spacer()
                Text("$\(price, specifier: "%.2f")")
                    .foregroundStyle(.white)
                    .strikethrough(discount != nil)
                
                if let discount {
                    Text("\(discount, specifier: "%.2f")")
                        .fontWeight(.semibold)
                }
            }
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 15)
                .fill(bgColor)
            RoundedRectangle(cornerRadius: 15)
                .stroke(.white)
        }
        .padding()
    }
}

#Preview {
    ZStack {
        Color.black.opacity(0.2).ignoresSafeArea()
        
        VStack {
            BuyNowView(price: 20, discountPercentage: 75)
            BuyNowView(price: 20, discountPercentage: nil)
        }
    }
}
