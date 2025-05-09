//
//  ContentView.swift
//  Factorer
//
//  Created by Vaibhav Mohankumar on 5/8/25.
//

import SwiftUI

enum Math: String, CaseIterable {
    case Quadratic, Factor, FOIL
}


struct ContentView: View {
    @State var selection: Math = .Factor
    @State private var number = ""
    @State private var answerFactor: [String] = []
    @State private var aValue: String = ""
    @State private var bValue: String = ""
    @State private var cValue: String = ""
    @State private var dValue: String = ""
    @State private var answerQuad: String = ""
    @State private var answerFoil: [String] = []

    
    var body: some View {
        VStack {
            Text("Factorer")
                .font(.system(size: 80))
                .fontDesign(.rounded)
                .bold(true)
                .frame(maxWidth: .infinity, alignment: .top)
                .padding(.bottom, 1)
            
            Text(selection.rawValue)
                .font(.system(size: 50))
                .fontDesign(.rounded)
                .bold(false)
            
            Picker("Select function", selection: $selection) {
                ForEach(Math.allCases, id: \.self) { Math in
                    Text(Math.rawValue)
                }
            }
            .pickerStyle(.segmented)
            .padding(.horizontal, 15)
            
            switch selection {
                
            case .Quadratic:
                Text("Enter Quadratic in form Ax^2+Bx+C")
                    .font(.system(size: 20))
                    .padding(20)
                
                TextField("A Value", text: $aValue)
                      .multilineTextAlignment(.center)
                      .foregroundColor(.purple)
                      .background(.gray.opacity(0.2))
                      .cornerRadius(50)
                      .padding(.horizontal, 50)
                      .padding(.vertical, 15)
                
                TextField("B Value", text: $bValue)
                      .multilineTextAlignment(.center)
                      .foregroundColor(.purple)
                      .background(.gray.opacity(0.2))
                      .cornerRadius(50)
                      .padding(.horizontal, 50)
                      .padding(.vertical, 15)

                
                TextField("C Value", text: $cValue)
                      .multilineTextAlignment(.center)
                      .foregroundColor(.purple)
                      .background(.gray.opacity(0.2))
                      .cornerRadius(50)
                      .padding(.horizontal, 50)
                      .padding(.vertical, 15)
                
                Text("The factored form is...")
                    .font(.system(size: 20))
                    .padding(20)
                
                Text(answerQuad)
                    .fontDesign(.rounded)
                    .foregroundColor(.blue)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
            case .Factor:
                Text("Get factors of")
                    .font(.system(size: 20))
                    .padding(20)
                
                TextField("Enter the number to factor", text: $number)
                      .multilineTextAlignment(.center)
                      .foregroundColor(.purple)
                      .background(.gray.opacity(0.2))
                      .cornerRadius(50)
                      .padding(.horizontal, 50)
                      .padding(.vertical, 15)
                
                Button("Get Answer", action: {
                    answerFactor = getFactors(number)
                })
                    .buttonStyle(.bordered)
                    .cornerRadius(50)
                    .padding(.vertical, 2)
                
                Text("The factors are...")
                    .font(.system(size: 20))
                    .padding(20)
                
                Text(answerFactor.joined(separator: ", "))
                    .fontDesign(.rounded)
                    .foregroundColor(.blue)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
            case .FOIL:
                Text("Enter Equation in form (a + b)(c + d)")
                    .font(.system(size: 20))
                    .padding(20)
                
                TextField("A Value", text: $aValue)
                      .multilineTextAlignment(.center)
                      .foregroundColor(.purple)
                      .background(.gray.opacity(0.2))
                      .cornerRadius(50)
                      .padding(.horizontal, 50)
                      .padding(.vertical, 15)
                
                TextField("B Value", text: $bValue)
                      .multilineTextAlignment(.center)
                      .foregroundColor(.purple)
                      .background(.gray.opacity(0.2))
                      .cornerRadius(50)
                      .padding(.horizontal, 50)
                      .padding(.vertical, 15)
                
                TextField("C Value", text: $cValue)
                      .multilineTextAlignment(.center)
                      .foregroundColor(.purple)
                      .background(.gray.opacity(0.2))
                      .cornerRadius(50)
                      .padding(.horizontal, 50)
                      .padding(.vertical, 15)
                
                TextField("D Value", text: $dValue)
                      .multilineTextAlignment(.center)
                      .foregroundColor(.purple)
                      .background(.gray.opacity(0.2))
                      .cornerRadius(50)
                      .padding(.horizontal, 50)
                      .padding(.vertical, 15)
                
                Button("Get Answer", action: {
                    answerFoil = calculateFoil(aValue, bValue, cValue, dValue)
                })
                    .buttonStyle(.bordered)
                    .cornerRadius(50)
                    .padding(.vertical, 2)
                
                Text("The foiled form is...")
                    .font(.system(size: 20))
                    .padding(10)
                
                Text(answerFoil.joined(separator: ""))
                    .fontDesign(.rounded)
                    .foregroundColor(.blue)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
            }
            
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
