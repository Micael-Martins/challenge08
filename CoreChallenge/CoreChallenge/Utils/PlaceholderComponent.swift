//
//  PlaceholderComponent.swift
//  CoreChallenge
//
//  Created by Thiago de Jesus on 26/09/25.
//

import Foundation
import SwiftUI

/// `Placeholder` é uma view que representa o estado vazio
/// quando nenhuma imagem foi selecionada pelo usuário.
///
/// Ele exibe um retângulo arredondado com opacidade reduzida
/// e um ícone de foto centralizado.
struct Placeholder: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .frame(width: 350, height: 200)
                .opacity(0.1)
            
            Image(systemName: "photo")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 30, height: 30)
                .foregroundStyle(.accent)
        }
    }
}

#Preview{
    Placeholder()
}
