//
//  Math.swift
//  Factorer
//
//  Created by Vaibhav Mohankumar on 5/8/25.
//

import Foundation

// Setup
var aValue: Double = 1
var bValue: Double = 2
var cValue: Double = 3
var dValue: Double = 4
var number: Int = 0

// Functions

func validateInput(_ value: Any) -> Double? {
    if let doubleValue = value as? Double {
        return doubleValue
    }
    if let stringValue = value as? String, let doubleValue = Double(stringValue) {
        return doubleValue
    }
    return nil
}

func calculateFactorsInteger(_ num: Int) -> [Int] {
    
    var factors: [Int] = []
    
    for i in 1...abs(num) {
        if num % i == 0 {
            factors.append(i)
            if num < 0 {
                factors.append(-i)
            }
        }
    }
    return factors
}

func calculateQuadratic(_ a: String, _ b: String, _ c: String) -> [String] {
    
    var ansOne: String = ""
    var ansTwo: String = ""
    
    if  let aValid = validateInput(a),
        let bValid = validateInput(b),
        let cValid = validateInput(c) {
        aValue = aValid
        bValue = bValid
        cValue = cValid
    } else {
        return ["Invalid Input(s)"]
    }
    
    if (aValue == 0) {
        return ["A value cannot be 0"]
    }
    
    let rootDiscriminant = pow(Double(bValue), 2) - (4 * Double(aValue) * Double(cValue))
    
    if rootDiscriminant < 0 {
        return calculateQuadraticImaginary(rootDiscriminant)
    }
    
    let sqrtDiscriminant = sqrt(rootDiscriminant)
    let equationTopPositive = -Double(bValue) + sqrtDiscriminant
    let equationTopNegative = -Double(bValue) - sqrtDiscriminant
    
    let finalRootPositive = equationTopPositive / (2 * Double(aValue))
    let finalRootNegative = equationTopNegative / (2 * Double(aValue))
    
    if(finalRootPositive > 0) {
        ansOne = "x = " + String(round(finalRootPositive * 100) / 100)
    } else if(finalRootPositive == 0){
        ansOne = "x = 0"
    } else {
        ansOne = "x = -" + String(abs(round(finalRootPositive * 100) / 100))
    }
    
    if(finalRootNegative > 0) {
        ansTwo = "x = " + String(round(finalRootNegative * 100) / 100)
    } else if(finalRootPositive == 0){
        ansTwo = "x = 0"
    } else {
        ansTwo = "x = -" + String(abs(round(finalRootNegative * 100) / 100))
    }
    
    return [ansOne, ansTwo]
}

func calculateQuadraticImaginary(_ rootDiscriminant: Double) -> [String] {
    
    var finalAns: String = ""
    
    let absDiscriminant = abs(rootDiscriminant)
    let imaginaryPart = "i√\(round(absDiscriminant * 100) / 100)"
    
    func checkB(_ b: Double) -> String {
        return b == 0 ? "" : String(-b)
    }
    
    let equation = "(\(checkB(bValue))±\(imaginaryPart))"
    let denominator = String(round(2 * Double(aValue) * 100) / 100)
    
    finalAns = "x = " + equation + "/" + denominator
    
    return [finalAns]
}

func calculateGcf(_ numOne: String, _ numTwo: String) -> String {
    var gcfOne: Int = 0;var gcfTwo: Int = 0
    var gcfOneFactors: [Int] = []
    var gcfTwoFactors: [Int] = []
    
    if let numOneValid = validateInput(numOne),
       let numTwoValid = validateInput(numTwo) {
        gcfOne = Int(numOneValid)
        gcfTwo = Int(numTwoValid)
    } else {
        return "Invalid Input(s)"
    }
    
    if (gcfOne == 0 || gcfTwo == 0) {
        return "No GCF"
    } else if (gcfOne < 0 || gcfTwo < 0) {
        return "Integer(s) must be positive"
    }
    
    gcfOneFactors = calculateFactorsInteger(gcfOne)
    gcfTwoFactors = calculateFactorsInteger(gcfTwo)
    
    var commonFactors: [Int] = []
    for factorOne in gcfOneFactors {
        for factorTwo in gcfTwoFactors {
            if factorOne == factorTwo {
                commonFactors.append(factorOne)
            }
        }
    }
    
    var tempNum: Int = commonFactors[0]
    
    for num in commonFactors {
        if num > tempNum {
            tempNum = num
        }
    }
    
    return String(tempNum)
}

func calculateFactorsString(_ num: String) -> [String] {
    
    if let numValid = validateInput(num) {
        number = Int(numValid)
    } else {
        return ["Invalid Input"]
    }
    
    if (number == 0) {
        return ["No Factors"]
    }
    
    var factors: [String] = []
    
    for i in 1...abs(number) {
        if number % i == 0 {
            factors.append(String(i))
            if number < 0 {
                factors.append(String(-i))
            }
        }
    }
    return factors
}

func calculateLcm(_ numOne: String, _ numTwo: String) -> String {
    var finalAns: String = ""
    return finalAns
}

func calculateFoil(_ a: String, _ b: String, _ c: String, _ d: String) -> [String] {
    
    var finalA: String = ""
    var finalB: String = ""
    var finalC: String = ""
    
    if  let aValid = validateInput(a),
        let bValid = validateInput(b),
        let cValid = validateInput(c),
        let dValid = validateInput(d) {
        aValue = aValid
        bValue = bValid
        cValue = cValid
        dValue = dValid
    } else {
        return ["Invalid Input(s)"]
    }
    
    if (aValue == 0 && cValue == 0) {
        return ["A and C values cannot be 0"]
    } else if(aValue == 0){
        return ["A value cannot be 0"]
    } else if (cValue == 0){
        return ["C value cannot be 0"]
    }

    aValue = aValue * cValue
    bValue = (aValue * dValue) + (cValue * bValue)
    cValue = bValue * dValue
    
    finalA = String(round(Double(aValue) * 100) / 100) + "x\u{00B2}"
    
    if (bValue < 0) {
        finalB = " - " + String(abs(round(Double(bValue) * 100) / 100)) + "x"
    } else {
        finalB = " + " + String(round(Double(bValue) * 100) / 100) + "x"
    }
    
    if (cValue < 0) {
        finalC = " - " + String(abs(round(Double(cValue) * 100) / 100))
    } else {
        finalC = " + " + String(round(Double(cValue) * 100) / 100)
    }
    
    return [finalA, finalB, finalC]
}
