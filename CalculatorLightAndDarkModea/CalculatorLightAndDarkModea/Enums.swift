//
//  Enums.swift
//  CalculatorLightAndDarkModea
//
//  Created by kamila on 21.04.2026.
//

import Foundation

enum Operation {
    case add
    case subtract
    case multiply
    case divide
    case none
}

enum CalcButton: String {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    case decimal = "."
    case add = "+"
    case subtract = "-"
    case multiply = "*"
    case divide = "/"
    case equal = "="
    case clear = "AC"
    case percent = "%"
    case negative = "IMGplus.forwardslash.minus"
    case undo = "IMGarrow.counterclockwise"
}

let enumOperations: [CalcButton] = [.add, .subtract, .multiply, .divide]
let multiplySymbol = CalcButton.multiply.rawValue
let divideSymbol = CalcButton.divide.rawValue

let operators = "+-*/"
