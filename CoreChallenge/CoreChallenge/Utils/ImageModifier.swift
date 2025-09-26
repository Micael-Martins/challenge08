//
//  ImageModifier.swift
//  CoreChallenge
//
//  Created by Thiago de Jesus on 26/09/25.
//

import Foundation
import SwiftUI

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
    func imageModifier() -> some View {
        modifier(ImageModifier())
    }
}
