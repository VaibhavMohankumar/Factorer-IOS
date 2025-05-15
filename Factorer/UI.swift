//
//  UI.swift
//  Factorer
//
//  Created by Vaibhav Mohankumar on 5/14/25.
//

import SwiftUI

func text(_ text: String, _ size: CGFloat, _ padH: CGFloat, _ padV: CGFloat) -> some View {
    Text(text)
        .font(.system(size: size))
        .fontDesign(.serif)
        .padding(.horizontal, padH)
        .padding(.vertical, padV)
}

func textBox(_ title: String, _ text: Binding<String>, _ padH: CGFloat, _ padV: CGFloat) -> some View {
    TextField(title, text: text)
        .fontDesign(.monospaced)
        .multilineTextAlignment(.center)
        .foregroundColor(.purple)
        .background(.gray.opacity(0.2))
        .cornerRadius(50)
        .padding(.horizontal, padH)
        .padding(.vertical, padV)
}

func button(_ action: @escaping () -> Void) -> some View {
    Button("Get Answer", action: action)
        .fontDesign(.serif)
        .fontWeight(.semibold)
        .buttonStyle(.bordered)
        .cornerRadius(50)
        .padding(.vertical, 2)
}

func answerBox(_ answer: String,_ size: CGFloat) -> some View {
    Text(answer)
        .font(.system(size: size))
        .fontDesign(.monospaced)
        .fontDesign(.rounded)
        .foregroundColor(.gray)
        .multilineTextAlignment(.center)
        .padding(.horizontal)
}
