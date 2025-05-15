//
//  ContentView.swift
//  Factorer
//
//  Created by Vaibhav Mohankumar on 5/8/25.
//

import SwiftUI

enum Math: String, CaseIterable {
    case Quadratic, General, FOIL
}

enum General: String, CaseIterable {
    case GCF, Factor, LCM
}


struct ContentView: View {
    @State var selectionMain: Math = .General
    @State var selectionGeneral: General = .Factor
    
    @State private var textOne: String = ""
    @State private var textTwo: String = ""
    @State private var textThree: String = ""
    @State private var textFour: String = ""
    @State private var answer: String = ""
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Factorer")
                    .font(.system(size: 80))
                    .fontDesign(.rounded)
                    .bold(true)
                    .padding(.bottom, 1)
                
                if (selectionMain == Math.Quadratic || selectionMain == Math.FOIL) {
                    Text(selectionMain.rawValue)
                        .font(.system(size: 50))
                        .fontDesign(.monospaced)
                        .bold(true)
                } else {
                    Text(selectionGeneral.rawValue)
                        .font(.system(size: 50))
                        .fontDesign(.monospaced)
                        .bold(true)
                }
                
                Picker("Select function", selection: $selectionMain) {
                    ForEach(Math.allCases, id: \.self) { Math in
                        Text(Math.rawValue)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.horizontal, 15)
                .onChange(of: selectionMain) {
                    selectionGeneral = General.Factor
                    // Clear all variables
                    textOne = ""
                    textTwo = ""
                    textThree = ""
                    textFour = ""
                    answer = ""
                }
                
                switch selectionMain {
                    
                case .Quadratic:
                    text("Enter Quadratic in form Ax\u{00B2}+Bx+C", 20, 20, 20)
                    
                    textBox("A Value", $textOne, 50, 15)
                    textBox("B Value", $textTwo, 50, 15)
                    textBox("C Value", $textThree, 50, 15)
                   
                    button({
                        answer = calculateQuadratic(textOne, textTwo, textThree)
                        UIApplication.shared.endEditing()
                    })
                    
                    text("The factored form is...", 20, 20, 20)
                    answerBox(answer, 22)
                    
                case .General:
                    Picker("Select General function", selection: $selectionGeneral) {
                        ForEach(General.allCases, id: \.self) { General in
                            Text(General.rawValue)
                        }
                    }
                    .pickerStyle(.segmented)
                    .padding(.horizontal, 40)
                    .padding(.vertical, 15)
                    .onChange(of: selectionGeneral) {
                        // Clear all variables
                        textOne = ""
                        textTwo = ""
                        textThree = ""
                        textFour = ""
                        answer = ""
                    }
                    
                    switch selectionGeneral {
                        
                    case .GCF:
                        text("Get Greatest Common Factor of", 20, 20, 20)
                        
                        HStack {
                            textBox("Integer One", $textOne, 15, 15)
                            text("and", 20, -15, 16)
                            textBox("Integer Two", $textTwo, 15, 15)
                        }
                        
                        button({
                            answer = calculateGcf(textOne, textTwo)
                            UIApplication.shared.endEditing()
                        })
                        
                        text("The Greatest Common Factor is...", 20, 20 , 20)
                        answerBox(answer, 20)
                        
                    case .Factor:
                        text("Get factors of", 20, 20, 20)
                        
                        textBox("Enter the Integer to factor", $textOne, 30, 15)
                        
                        button({
                            answer = calculateFactorsString(textOne)
                            UIApplication.shared.endEditing()
                        })
                        
                        text("The factors are...", 20, 20, 20)
                        answerBox(answer, 20)
                        
                    case.LCM:
                        text("Get Least Common Multiple of", 20, 20, 20)

                        HStack {
                            textBox("Integer One", $textOne, 15, 15)
                            text("and", 20, -15, 16)
                            textBox("Integer Two", $textTwo, 15, 15)
                        }
                        
                        button({
                            answer = calculateLcm(textOne, textTwo)
                            UIApplication.shared.endEditing()
                        })
                        
                        text("The Least Common Multiple is...", 20, 20, 20)
                        answerBox(answer, 20)
                    }
                    
                case .FOIL:
                   text("Enter Equation in form (Ax + B)(Cx + D)", 18, 20, 20)
                    
                    textBox("A Value", $textOne, 50, 15)
                    textBox("B Value", $textTwo, 50, 15)
                    textBox("C Value", $textThree, 50, 15)
                    textBox("D Value", $textFour, 50, 15)
                    
                    button({
                        answer = calculateFoil(textOne, textTwo, textThree, textFour)
                        UIApplication.shared.endEditing()
                    })

                    
                    text("The foiled form is...", 20, 10, 10)
                    answerBox(answer, 23)
                }
                
                Spacer()
            }
        }
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

#Preview {
    ContentView()
}
