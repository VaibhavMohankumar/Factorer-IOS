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
    
    @State private var aValueQuad: String = ""
    @State private var bValueQuad: String = ""
    @State private var cValueQuad: String = ""
    @State private var answerQuad: [String] = []
    
    @State private var aValueFoil: String = ""
    @State private var bValueFoil: String = ""
    @State private var cValueFoil: String = ""
    @State private var dValueFoil: String = ""
    @State private var answerFoil: [String] = []
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Factorer")
                    .font(.system(size: 80))
                    .fontDesign(.rounded)
                    .bold(true)
                    .frame(maxWidth: .infinity, alignment: .top)
                    .padding(.bottom, 1)
                
                Text(selection.rawValue)
                    .font(.system(size: 50))
                    .fontDesign(.monospaced)
                    .bold(false)
                
                Picker("Select function", selection: $selection) {
                    ForEach(Math.allCases, id: \.self) { Math in
                        Text(Math.rawValue)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.horizontal, 15)
                .onChange(of: selection) {
                    // Clear all variables
                    number = ""
                    answerFactor = []
                    
                    aValueQuad = ""
                    bValueQuad = ""
                    cValueQuad = ""
                    answerQuad = []
                    
                    aValueFoil = ""
                    bValueFoil = ""
                    cValueFoil = ""
                    dValueFoil = ""
                    answerFoil = []
                }
                
                switch selection {
                    
                case .Quadratic:
                    Text("Enter Quadratic in form Ax\u{00B2}+Bx+C")
                        .font(.system(size: 20))
                        .fontDesign(.serif)
                        .padding(.horizontal, 0)
                        .padding(.vertical, 20)
                    
                    TextField("A Value", text: $aValueQuad)
                        .fontDesign(.monospaced)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.purple)
                        .background(.gray.opacity(0.2))
                        .cornerRadius(50)
                        .padding(.horizontal, 50)
                        .padding(.vertical, 15)
                    
                    TextField("B Value", text: $bValueQuad)
                        .fontDesign(.monospaced)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.purple)
                        .background(.gray.opacity(0.2))
                        .cornerRadius(50)
                        .padding(.horizontal, 50)
                        .padding(.vertical, 15)
                    
                    
                    TextField("C Value", text: $cValueQuad)
                        .fontDesign(.monospaced)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.purple)
                        .background(.gray.opacity(0.2))
                        .cornerRadius(50)
                        .padding(.horizontal, 50)
                        .padding(.vertical, 15)
                    
                    Button("Get Answer", action: {
                        answerQuad = calculateQuadratic(aValueQuad, bValueQuad, cValueQuad)
                        UIApplication.shared.endEditing()
                    })
                    .fontDesign(.serif)
                    .fontWeight(.semibold)
                    .buttonStyle(.bordered)
                    .cornerRadius(50)
                    .padding(.vertical, 2)
                    
                    Text("The factored form is...")
                        .fontDesign(.serif)
                        .font(.system(size: 20))
                        .padding(20)
                    
                    Text(answerQuad.joined(separator: " , "))
                        .fontDesign(.monospaced)
                        .font(.system(size: 22))
                        .fontDesign(.rounded)
                        .foregroundColor(.blue)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    
                case .Factor:
                    Text("Get factors of")
                        .fontDesign(.serif)
                        .font(.system(size: 20))
                        .padding(20)
                    
                    TextField("Enter the integer to factor", text: $number)
                        .fontDesign(.monospaced)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.purple)
                        .background(.gray.opacity(0.2))
                        .cornerRadius(50)
                        .padding(.horizontal, 30)
                        .padding(.vertical, 15)
                    
                    Button("Get Answer", action: {
                        answerFactor = calculateFactors(number)
                        UIApplication.shared.endEditing()
                    })
                    .fontDesign(.serif)
                    .fontWeight(.semibold)
                    .buttonStyle(.bordered)
                    .cornerRadius(50)
                    .padding(.vertical, 2)
                    
                    Text("The factors are...")
                        .fontDesign(.serif)
                        .font(.system(size: 20))
                        .padding(20)
                    
                    Text(answerFactor.joined(separator: ", "))
                        .fontDesign(.monospaced)
                        .font(.system(size: 20))
                        .fontDesign(.rounded)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                
                    
                case .FOIL:
                    Text("Enter Equation in form (Ax + B)(Cx + D)")
                        .font(.system(size: 18))
                        .fontDesign(.serif)
                        .padding(20)
                    
                    TextField("A Value", text: $aValueFoil)
                        .fontDesign(.monospaced)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.purple)
                        .background(.gray.opacity(0.2))
                        .cornerRadius(50)
                        .padding(.horizontal, 50)
                        .padding(.vertical, 15)
                    
                    TextField("B Value", text: $bValueFoil)
                        .fontDesign(.monospaced)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.purple)
                        .background(.gray.opacity(0.2))
                        .cornerRadius(50)
                        .padding(.horizontal, 50)
                        .padding(.vertical, 15)
                    
                    TextField("C Value", text: $cValueFoil)
                        .fontDesign(.monospaced)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.purple)
                        .background(.gray.opacity(0.2))
                        .cornerRadius(50)
                        .padding(.horizontal, 50)
                        .padding(.vertical, 15)
                    
                    TextField("D Value", text: $dValueFoil)
                        .fontDesign(.monospaced)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.purple)
                        .background(.gray.opacity(0.2))
                        .cornerRadius(50)
                        .padding(.horizontal, 50)
                        .padding(.vertical, 15)
                    
                    Button("Get Answer", action: {
                        answerFoil = calculateFoil(aValueFoil, bValueFoil, cValueFoil, dValueFoil)
                    })
                    .fontDesign(.serif)
                    .fontWeight(.semibold)
                    .buttonStyle(.bordered)
                    .cornerRadius(50)
                    .padding(.vertical, 2)
                    
                    Text("The foiled form is...")
                        .font(.system(size: 20))
                        .fontDesign(.serif)
                        .padding(10)
                    
                    Text(answerFoil.joined(separator: ""))
                        .font(.system(size: 23))
                        .fontDesign(.monospaced)
                        .fontDesign(.rounded)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
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
