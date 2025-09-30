//
//  ImageModifier.swift
//  CoreChallenge
//
//  Created by Thiago de Jesus on 26/09/25.
//

import Foundation
import SwiftUI

/// `ImageModifier` é um `ViewModifier` reutilizável que aplica
/// um estilo padronizado para exibir imagens no aplicativo.
///
/// Ele garante que a imagem preencha o espaço disponível,
/// mantenha proporções, seja cortada corretamente e tenha
/// cantos arredondados com uma transição suave.
struct ImageModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .scaledToFill()
            .frame(width: 350, height: 200)
            .clipped()
            .cornerRadius(12)
            .transition(.opacity)
    }
}

extension View {
    /// Aplica o modificador `ImageModifier` a qualquer view,
    /// facilitando a reutilização do estilo para imagens.
    func imageModifier() -> some View {
        modifier(ImageModifier())
    }
}
