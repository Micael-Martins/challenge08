//
//  ButtonComponent.swift
//  CoreChallenge
//
//  Created by Thiago de Jesus on 25/09/25.
//

import Foundation
import SwiftUI

/// `CustomButton` é um botão reutilizável e estilizado que
/// recebe um texto e uma ação a ser executada quando clicado.
///
/// Ele aplica um estilo consistente para ser usado em várias telas do app.
struct CustomButton: View {
    
    /// Texto exibido dentro do botão.
    let label: String
    
    /// Ação executada quando o botão é pressionado.
    let action: () -> Void
    
    /// Inicializa um botão customizado.
    /// - Parameters:
    ///   - label: Texto exibido no botão.
    ///   - action: Closure chamada quando o botão for pressionado.
    init(label: String, action: @escaping () -> Void){
        self.label = label
        self.action = action
    }
    
    var body: some View {
        Button(label) {
            action()
        }
        .font(.system(size: 18, weight: .bold, design: .default))
        .foregroundStyle(.white)
        .frame(width: 270, height: 56)
        .background(Color.accent)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .padding(.vertical)

    }
}
