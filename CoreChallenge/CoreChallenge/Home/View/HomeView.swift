//
//  ContentView.swift
//  CoreChallenge
//
//  Created by Micael Martins de Moura on 24/09/25.
//

import SwiftUI

struct HomeView: View {
    @State var action: String? = nil

    var body: some View {
        VStack {
            CustomButton(label: "Foto", action: {
                action = "Foto"
            })
        }
        .padding()
        .navigationDestination(item: $action) { action in
            PhotoView()
        }

    }
}

#Preview {
    HomeView()
}
