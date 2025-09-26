//
//  ContentView.swift
//  CoreChallenge
//
//  Created by Micael Martins de Moura on 24/09/25.
//

import SwiftUI

struct HomeView: View {
    @State var action: String? = nil
    @State var audio: String? = nil

    var body: some View {
        VStack {
            CustomButton(label: "Foto", action: {
                action = "Foto"
            })
            CustomButton(label: "Audio", action: {
                action = "Audio"
            })
        }
        .padding()
        .navigationDestination(item: $action) { action in
            if action == "Foto" {
                PhotoView()
            }
            if action == "Audio" {
                AudioView()
            }
        }

    }
}

#Preview {
    HomeView()
}
