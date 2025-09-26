//
//  ButtonComponent.swift
//  CoreChallenge
//
//  Created by Thiago de Jesus on 25/09/25.
//

import Foundation
import SwiftUI

struct CustomButton: View {
    
    let label: String
    let action: () -> Void
    
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


