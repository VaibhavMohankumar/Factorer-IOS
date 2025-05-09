//
//  Math.swift
//  Factorer
//
//  Created by Vaibhav Mohankumar on 5/8/25.
//

import Foundation

// Setup
var aValue: Int = 1
var bValue: Int = 2
var cValue: Int = 3
var rootDiscriminant: Double = 0

// Functions

func validateInput(_ value: Any) -> Int? {
    if let intValue = value as? Int {
        return intValue
    }
    if let stringValue = value as? String, let intValue = Int(stringValue) {
        return intValue
    }
    return nil
}

func setValues(_ a: Any, _ b: Any, _ c: Any) -> String? {
    if let aValid = validateInput(a),
       let bValid = validateInput(b),
       let cValid = validateInput(c) {
        aValue = aValid
        bValue = bValid
        cValue = cValid
        return nil
    } else {
        return "e"
    }
}

func getRootType() -> String {
    rootDiscriminant = pow(Double(bValue), 2) - (4 * Double(aValue) * Double(cValue))
    if rootDiscriminant >= 0 {
        return "r"
    } else {
        return "i"
    }
}

func getFactors(_ number: Int) -> [String] {
    var factors: [String] = []
    for i in 1...abs(number) {
        if number % i == 0 {
            factors.append(String(i))
            factors.append(String(-i))
        }
    }
    return factors
}

func quadraticEquation() -> [Any]? {
    rootDiscriminant = pow(Double(bValue), 2) - (4 * Double(aValue) * Double(cValue))
    
    if getRootType() == "i" {
        return quadraticImaginary()
    }
    
    let sqrtDiscriminant = sqrt(rootDiscriminant)
    let equationTopPositive = -Double(bValue) + sqrtDiscriminant
    let equationTopNegative = -Double(bValue) - sqrtDiscriminant
    
    let finalRootPositive = equationTopPositive / (2 * Double(aValue))
    let finalRootNegative = equationTopNegative / (2 * Double(aValue))
    
    return [round(finalRootPositive * 100) / 100, round(finalRootNegative * 100) / 100]
}

func quadraticImaginary() -> [String] {
    let absDiscriminant = abs(rootDiscriminant)
    let imaginaryPart = "i√\(round(absDiscriminant * 100) / 100)"
    
    func checkB(_ b: Int) -> String {
        return b == 0 ? "" : String(-b)
    }
    
    let equation = "(\(checkB(bValue))±\(imaginaryPart))"
    let denominator = String(round(2 * Double(aValue) * 100) / 100)
    
    return [equation, denominator]
}

func calculateFoil(_ a: Int, _ b: Int, _ c: Int, _ d: Int) -> [Double] {
    aValue = a * c
    bValue = (a * d) + (c * b)
    cValue = b * d
    
    return [
        round(Double(aValue) * 100) / 100,
        round(Double(bValue) * 100) / 100,
        round(Double(cValue) * 100) / 100
    ]
}
