//
//  ButtonModifier.swift
//  CoreChallenge
//
//  Created by Thiago de Jesus on 26/09/25.
//

import Foundation
import SwiftUI

struct ButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 18, weight: .bold, design: .default))
            .foregroundStyle(.white)
            .frame(width: 270, height: 56)
            .background(Color.accent)
            .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}
