//
//  PhotoView.swift
//  CoreChallenge
//
//  Created by Thiago de Jesus on 26/09/25.
//

import SwiftUI
import PhotosUI
import C08_Package_G1

/// `PhotoView` é a tela responsável por selecionar e exibir uma foto.
/// 
/// O usuário pode carregar uma imagem da galeria, visualizar a imagem selecionada
/// e acionar a análise (futuramente integrada ao CoreML). Também é exibido um rótulo
/// indicando se o animal detectado é doméstico ou não.
struct PhotoView: View {
    
    /// ViewModel que gerencia o estado e os dados da tela,
    /// como a foto selecionada, imagem convertida e resultado da análise.
    @State var viewModel: PhotoViewModel
    

    /// Inicializador que permite injetar um `PhotoViewModel`.
    /// Caso não seja fornecido, cria uma instância padrão.
    init(viewModel: PhotoViewModel = .init()){
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack{
            // Exibe a imagem escolhida ou um placeholder
            showImage()
            
            if viewModel.isVisible {
                // Exibe o resultado da análise: "Doméstico" ou "Não Doméstico"
                //Text(viewModel.domestic ? "Doméstico" : "Não Doméstico")
                    //.padding(5)
            }
            // Picker para o usuário selecionar uma imagem da galeria
            PhotosPicker(selection: $viewModel.selectedPhoto, matching: .images) {
                Text("Selecionar Foto")
                    .modifier(ButtonModifier())
            }
            .padding(.top, 40)
            
            // Botão que acionará a análise da imagem (futuro CoreML)
            CustomButton(label: "Analisar") {
                
                Task{
                    let manager = PackageManager()
                    guard let image = viewModel.image else { return }
                    
                    viewModel.domestic = await manager.analisar(image: image)
                    
                    print(viewModel.domestic?.name ?? "Nenhum")
                    print(viewModel.domestic?.isPet ?? false)
                }
                viewModel.isVisible = true
            }
        }
        .padding(.bottom, 100)
        // Sempre que a foto selecionada mudar, converte os dados para imagem
        .onChange(of: viewModel.selectedPhoto) { _, _ in
            Task{
                await viewModel.convertDataToImage()
            }
        }
    }
    
    /// Exibe a imagem selecionada pelo usuário, com botão para removê-la,
    /// ou um `Placeholder` caso nenhuma imagem tenha sido escolhida.
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
                        viewModel.isVisible = false
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
