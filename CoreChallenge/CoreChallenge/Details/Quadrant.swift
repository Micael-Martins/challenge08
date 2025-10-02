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
    let description: String
    
    
    var body: some View {
        ZStack {
            backgroundColor
            VStack(spacing: 16) {
                HStack {
                    Text(title)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Image(systemName: sysImageName)
                        .font(.title)
                        .foregroundStyle(.white)
                }
                Text(description)
                    .foregroundColor(.white)
                    .font(.system(size: 16))
            }
        }
    }
}
