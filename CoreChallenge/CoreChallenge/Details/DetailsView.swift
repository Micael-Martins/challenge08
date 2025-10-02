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
                QuadrantView(backgroundColor: .blue, title: "Alimentação", sysImageName: "fork.knife", descriptions: content.feed)
                QuadrantView(backgroundColor: .green, title: "Cuidados", sysImageName: "heart.fill", descriptions: content.careTips)
            }
            .ignoresSafeArea()
            
            Button("Voltar") {
                dismiss()
            }.position(x: 50, y: 30)
        }
    }
}
