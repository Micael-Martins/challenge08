//
//  DetailsView.swift
//  screen
//
//  Created by israel lacerda gomes santos on 30/09/25.
//

import SwiftUI


struct DetailsView: View {
    @Environment(\.dismiss) var dismiss
    let content : DetailsModel
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                QuadrantView(backgroundColor: .red.opacity(0.4), title: "Alimentação", sysImageName: "fork.knife", description: content.feed)
                QuadrantView(backgroundColor: .green.opacity(0.4), title: "Cuidados", sysImageName: "heart.fill", description: content.careTips)
            }
            .ignoresSafeArea()
            
            Button("Voltar") {
                dismiss()
            }.position(x: 50, y: 30)
        }
    }
}
