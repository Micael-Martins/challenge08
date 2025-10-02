//
//  Quadrant.swift
//  screen
//
//  Created by israel lacerda gomes santos on 30/09/25.
//

import SwiftUI

struct QuadrantView: View {
    
    let backgroundColor: Color
    let title: String
    let sysImageName: String
    let descriptions: String
    
    var body: some View {
        ZStack {
            backgroundColor.opacity(0.4)
            VStack(spacing: 16) {
                HStack {
                    Text(title)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    Image(systemName: sysImageName)
                        .font(.title)
                        .foregroundStyle(.black)
                }
                Text(descriptions)
                    .foregroundColor(.black)
                    .font(.system(size: 16))
                    .frame(width: 300)
                    .multilineTextAlignment(.center)
                
                
            }
        }
    }
}
