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
    
    @State private var aValueQuad: String = ""
    @State private var bValueQuad: String = ""
    @State private var cValueQuad: String = ""
    @State private var answerQuad: [String] = []
    
    @State private var numberGcfOne: String = ""
    @State private var numberGcfTwo: String = ""
    @State private var answerGcf: String = ""
    
    @State private var numberFactor: String = ""
    @State private var answerFactor: [String] = []
    
    @State private var numberLcmOne: String = ""
    @State private var numberLcmTwo: String = ""
    @State private var answerLcm: String = ""
    
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
                    numberFactor = ""
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
                
                switch selectionMain {
                    
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
                        numberGcfOne = ""
                        numberGcfTwo = ""
                        answerGcf = ""
                        
                        numberFactor = ""
                        answerFactor = []
                        
                        numberLcmOne = ""
                        numberLcmTwo = ""
                        answerLcm = ""
                    }
                    
                    switch selectionGeneral {
                        
                    case .GCF:
                        Text("Get Greatest Common Factor of")
                            .fontDesign(.serif)
                            .font(.system(size: 20))
                            .padding(20)
                        HStack {
                            TextField("Integer One", text: $numberGcfOne)
                                .fontDesign(.monospaced)
                                .multilineTextAlignment(.center)
                                .foregroundColor(.purple)
                                .background(.gray.opacity(0.2))
                                .cornerRadius(50)
                                .padding(.horizontal, 15)
                                .padding(.vertical, 15)
                            
                            Text("and")
                                .fontDesign(.serif)
                                .font(.system(size: 20))
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, -15)
                            
                            TextField("Integer Two", text: $numberGcfTwo)
                                .fontDesign(.monospaced)
                                .multilineTextAlignment(.center)
                                .foregroundColor(.purple)
                                .background(.gray.opacity(0.2))
                                .cornerRadius(50)
                                .padding(.horizontal, 15)
                                .padding(.vertical, 15)
                        }
                        
                        Button("Get Answer", action: {
                            answerGcf = calculateGcf(numberGcfOne, numberGcfTwo)
                            UIApplication.shared.endEditing()
                        })
                        .fontDesign(.serif)
                        .fontWeight(.semibold)
                        .buttonStyle(.bordered)
                        .cornerRadius(50)
                        .padding(.vertical, 2)
                        
                        Text("The Greatest Common Factor is...")
                            .fontDesign(.serif)
                            .font(.system(size: 20))
                            .padding(20)
                        
                        Text(answerGcf)
                            .fontDesign(.monospaced)
                            .font(.system(size: 20))
                            .fontDesign(.rounded)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        
                    case .Factor:
                        Text("Get factors of")
                            .fontDesign(.serif)
                            .font(.system(size: 20))
                            .padding(20)
                        
                        TextField("Enter the integer to factor", text: $numberFactor)
                            .fontDesign(.monospaced)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.purple)
                            .background(.gray.opacity(0.2))
                            .cornerRadius(50)
                            .padding(.horizontal, 30)
                            .padding(.vertical, 15)
                        
                        Button("Get Answer", action: {
                            answerFactor = calculateFactorsString(numberFactor)
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
                    case.LCM:
                        Text("Get Least Common Multiple of")
                            .fontDesign(.serif)
                            .font(.system(size: 20))
                            .padding(20)

                        HStack {
                            TextField("Integer One", text: $numberLcmOne)
                                .fontDesign(.monospaced)
                                .multilineTextAlignment(.center)
                                .foregroundColor(.purple)
                                .background(.gray.opacity(0.2))
                                .cornerRadius(50)
                                .padding(.horizontal, 15)
                                .padding(.vertical, 15)
                            
                            Text("and")
                                .fontDesign(.serif)
                                .font(.system(size: 20))
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, -15)
                            
                            TextField("Integer Two", text: $numberLcmTwo)
                                .fontDesign(.monospaced)
                                .multilineTextAlignment(.center)
                                .foregroundColor(.purple)
                                .background(.gray.opacity(0.2))
                                .cornerRadius(50)
                                .padding(.horizontal, 15)
                                .padding(.vertical, 15)
                        }
                        
                        Button("Get Answer", action: {
                            answerLcm = calculateLcm(numberLcmOne, numberLcmTwo)
                            UIApplication.shared.endEditing()
                        })
                        .fontDesign(.serif)
                        .fontWeight(.semibold)
                        .buttonStyle(.bordered)
                        .cornerRadius(50)
                        .padding(.vertical, 2)
                        
                        Text("The Least Common Multiple is...")
                            .fontDesign(.serif)
                            .font(.system(size: 20))
                            .padding(20)
                        
                        Text(answerLcm)
                            .fontDesign(.monospaced)
                            .font(.system(size: 20))
                            .fontDesign(.rounded)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }
                    
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
                        UIApplication.shared.endEditing()
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
