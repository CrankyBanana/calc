//
//  main.swift
//  calc
//
//  Created by Jesse Clark on 12/3/18.
//  Copyright © 2018 UTS. All rights reserved.
//

import Foundation

// var args = ProcessInfo.processInfo.arguments
// args.removeFirst() // remove the name of the program
// print(Int(args[0])!)

extension String {

    var length: Int {
        return count
    }

    subscript (i: Int) -> String {
        return self[i ..< i + 1]
    }

    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, length) ..< length]
    }

    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }

    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
}

var args1 = readLine()!

func clearSpaces(toBeReplaced: String) -> String {
    args1 = toBeReplaced.replacingOccurrences(of: " ", with: "")
    return args1
}

func add(num1: Int, num2: Int) -> Int {
    return num1 + num2
}

func subtract(num1: Int, num2: Int) -> Int {
    return num1 - num2
}

func multiply(num1: Int, num2: Int) -> Int {
    return num1 * num2
}

func divide(num1: Int, num2: Int) -> Int {
    return num1 / num2
}

func modulus(num1: Int, num2: Int) -> Int {
    return num1 % num2
}

func calculate(num1: Int, operation: String, num2: Int) -> Int {
    var result:Int?
    switch operation {
        case "+": result = add(num1: num1, num2: num2); break
        case "-": result = subtract(num1: num1, num2: num2); break
        case "*": result = multiply(num1: num1, num2: num2); break
        case "/": result = divide(num1: num1, num2: num2); break
        case "%": result = modulus(num1: num1, num2: num2); break
        default: print("Error")
    }
    return result!
}

func algorithm(equation: String) -> Int{
    var tempEquation = clearSpaces(toBeReplaced: equation)
    var first:Int = Int(tempEquation[0])!
    var second:Int = Int(tempEquation[2])!
    var operation = tempEquation[1]
    var result = calculate(num1: first, operation: operation, num2: second)
    return result
}

print(algorithm(equation: args1))
