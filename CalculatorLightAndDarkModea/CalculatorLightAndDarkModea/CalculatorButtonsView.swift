//
//  CalculatorButtonsView.swift
//  CalculatorLightAndDarkModea
//
//  Created by kamila on 16.04.2026.
//

import SwiftUI

struct CalculatorButtonModel: Identifiable {
    let id = UUID()
    let calcButton: CalcButton
    var color = foregroundDigitsColor
}

struct RowsOfButtons: Identifiable {
    let id = UUID()
    let row: [CalculatorButtonModel]
}

struct CalculatorButtonsView: View {
    @Binding var currentComputation: String
    @Binding var mainResult: String
    
    let buttonData: [RowsOfButtons] = [
        RowsOfButtons(row: [
            CalculatorButtonModel(calcButton: .clear, color: foregroundTopButtonsColor),
            CalculatorButtonModel(calcButton: .negative, color: foregroundTopButtonsColor),
            CalculatorButtonModel(calcButton: .percent, color: foregroundTopButtonsColor),
            CalculatorButtonModel(calcButton: .divide, color: foregroundRightButtonsColor)
        ]),
        RowsOfButtons(row: [
            CalculatorButtonModel(calcButton: .seven),
            CalculatorButtonModel(calcButton: .eight),
            CalculatorButtonModel(calcButton: .nine),
            CalculatorButtonModel(calcButton: .multiply, color: foregroundRightButtonsColor)
        ]),
        RowsOfButtons(row: [
            CalculatorButtonModel(calcButton: .four),
            CalculatorButtonModel(calcButton: .five),
            CalculatorButtonModel(calcButton: .six),
            CalculatorButtonModel(calcButton: .divide, color: foregroundRightButtonsColor)
        ]),
        RowsOfButtons(row: [
            CalculatorButtonModel(calcButton: .one),
            CalculatorButtonModel(calcButton: .two),
            CalculatorButtonModel(calcButton: .three),
            CalculatorButtonModel(calcButton: .add, color: foregroundRightButtonsColor)
        ]),
        RowsOfButtons(row: [
            CalculatorButtonModel(calcButton: .undo),
            CalculatorButtonModel(calcButton: .zero),
            CalculatorButtonModel(calcButton: .decimal),
            CalculatorButtonModel(calcButton: .equal, color: foregroundRightButtonsColor)
        ])
    ]
    
    var body: some View {
        Grid() {
            ForEach(buttonData) { data in
                GridRow {
                    ForEach(data.row) { model in
                        Button {
                            print("pressed")
                        } label: {
                            ButtonView(
                                calcButton: model.calcButton,
                                fgColor: model.color,
                                bgColor: buttonBackgroundColor
                            )
                        }

                    }
                }
            }
        }
        .padding()
        .background(secondaryBackgroundColor.cornerRadius(20))
    }
}

#Preview {
    CalculatorButtonsView(
        currentComputation: .constant(""),
        mainResult: .constant("0")
    )
}
