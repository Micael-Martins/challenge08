//
//  ButtonModifier.swift
//  CoreChallenge
//
//  Created by Thiago de Jesus on 26/09/25.
//

import Foundation
import SwiftUI

/// `ButtonModifier` é um `ViewModifier` reutilizável que aplica
/// um estilo consistente para botões em todo o aplicativo.
///
/// Esse modificador define a fonte, cor do texto, tamanho fixo,
/// cor de fundo e bordas arredondadas para qualquer view de texto ou botão.
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
