//
//  PhotoView.swift
//  CoreChallenge
//
//  Created by Thiago de Jesus on 26/09/25.
//

import SwiftUI
import PhotosUI
import C08_Package_G1
import PacoteSoundAnalysis

/// `PhotoView` é a tela responsável por selecionar e exibir uma foto.
///
/// O usuário pode carregar uma imagem da galeria, tanto por um toque no botão quanto
/// por um assobio, visualizar a imagem selecionada e acionar a análise. Também é exibido um rótulo
/// indicando se o animal detectado é doméstico ou não.
struct PhotoView: View {
    
    @StateObject private var audioManager = AudioManager()
    
    /// ViewModel que gerencia o estado e os dados da tela,
    /// como a foto selecionada, imagem convertida e resultado da análise.
    @State var viewModel: PhotoViewModel
    
    @State private var isShowingPhotoPicker = false
    
    var animalName: String = ""
    
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
            
            // O botão agora apenas ativa o estado que mostra o seletor de fotos.
            Button(action: {
                isShowingPhotoPicker = true
            }) {
                Text("Selecionar Foto")
                    .modifier(ButtonModifier())
            }
            
            // Ele é acionado quando `isShowingPhotoPicker` se torna `true`.
            .photosPicker(
                isPresented: $isShowingPhotoPicker,
                selection: $viewModel.selectedPhoto,
                matching: .images
            )
            .padding(.top, 40)
            
            // Botão que acionará a análise da imagem e a busca de informações
            CustomButton(label: "Analisar") {
                Task {
                    let manager = PackageManager()
                    guard let image = viewModel.image else { return }
                    
                    viewModel.domestic = await manager.analyze(image: image)
                    
                    // Imprime o resultado da análise inicial
                    print(viewModel.domestic?.name ?? "Nenhum")
                    print(viewModel.domestic?.isPet ?? false)
                }
                viewModel.isVisible = true
            }
            
            CustomButton(label: "Ver detalhes") {
                Task {
                    if let animalName = viewModel.domestic?.name {
                        await viewModel.generateDetailsData(animal: animalName)
                        viewModel.isDetailsVisible = true
                    } else {
                        print("É preciso analisar uma imagem primeiro para ver os detalhes.")
                    }
                }
            }
        }
        .task{
            DispatchQueue.main.async {
                audioManager.iniciarMonitor(onDetection: {
                    isShowingPhotoPicker = true
                    audioManager.pararMonitor()
                }, classification: "whistling")
            }
        }
        .padding(.bottom, 100)
        // Sempre que a foto selecionada mudar, converte os dados para imagem
        .onChange(of: viewModel.selectedPhoto) { _, _ in
            Task{
                await viewModel.convertDataToImage()
            }
        }
        .fullScreenCover(isPresented: $viewModel.isDetailsVisible){ // modal de tela cheia
            DetailsView(content: DetailsModel(feed: viewModel.feed, careTips: viewModel.careTips))
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
