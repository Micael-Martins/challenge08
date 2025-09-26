//
//  PhotoView.swift
//  CoreChallenge
//
//  Created by Thiago de Jesus on 26/09/25.
//

import SwiftUI
import PhotosUI

struct PhotoView: View {
    
    @State var viewModel: PhotoViewModel

    init(viewModel: PhotoViewModel = .init()){
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack{
            showImage()
            PhotosPicker(selection: $viewModel.selectedPhoto, matching: .images) {
                Text("Selecionar Foto")
                    .modifier(ButtonModifier())
            }
            .padding(.top, 70)
            CustomButton(label: "Analisar") {
                //TODO: Add func do CoreML
            }
        }
        .padding(.bottom, 100)
        .onChange(of: viewModel.selectedPhoto) { _, _ in
            Task{
                await viewModel.convertDataToImage()
            }
        }
    }
    
    @ViewBuilder
    func showImage() -> some View {
        if let image = viewModel.image {
            ZStack(alignment: .topTrailing) {
                Image(uiImage: image)
                    .resizable()
                    .imageModifier()
                Button {
                    withAnimation {
                        viewModel.selectedPhoto = nil
                        viewModel.image = nil
                    }
                } label: {
                    Image(systemName: "xmark.circle.fill")
                      .font(.title2)
                      .foregroundColor(.white)
                      .shadow(radius: 2)
                      .padding(8)
                }
            }
        } else { Placeholder() }
    }
}
#Preview {
    PhotoView()
}
