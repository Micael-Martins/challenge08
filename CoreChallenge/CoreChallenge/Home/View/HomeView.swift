//
//  ContentView.swift
//  CoreChallenge
//
//  Created by Micael Martins de Moura on 24/09/25.
//

import SwiftUI

/// `HomeView` é a tela inicial do aplicativo.
///
/// Nesta tela, exibimos um botão personalizado (`CustomButton`) que,
/// quando pressionado, atualiza o estado `action` com uma string.
/// Esse estado é usado para controlar a navegação: quando `action`
/// recebe um valor diferente de `nil`, ocorre a navegação automática
/// para a `PhotoView`.
struct HomeView: View {
    /// Estado que armazena a ação atual do usuário.
    /// - Quando `nil`, nenhuma navegação acontece.
    /// - Quando recebe uma string (ex: `"Foto"`), a navegação é disparada.
    @State var action: String? = nil

    var body: some View {
        VStack {
            // Botão customizado que, ao ser clicado, define `action` como "Foto"
            CustomButton(label: "Foto", action: {
                action = "Foto"
            })
        }
        .padding()
        // Define a navegação para `PhotoView` quando `action` recebe um valor
        .navigationDestination(item: $action) { action in
            PhotoView()
        }
    }
}

#Preview {
    HomeView()
}
