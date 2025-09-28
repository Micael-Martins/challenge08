//
//  PhotoViewModel.swift
//  CoreChallenge
//
//  Created by Thiago de Jesus on 26/09/25.
//

import UIKit
import SwiftUI
import PhotosUI

/// `PhotoViewModel` é responsável por gerenciar o estado e os dados
/// utilizados pela `PhotoView`.
///
/// Ele segue o padrão MVVM, armazenando a imagem selecionada,
/// controlando o status "doméstico" e fornecendo métodos para
/// converter os dados recebidos do `PhotosPicker`.
@Observable
class PhotoViewModel {
    
    /// Imagem já processada a partir dos dados do `PhotosPickerItem`.
    var image: UIImage?
    
    /// Foto bruta selecionada pelo usuário através do `PhotosPicker`.
    var selectedPhoto: PhotosPickerItem?
    
    /// Indicador se o animal detectado é doméstico (`true`) ou não (`false`).
    var domestic: Bool = true
    
    /// Converte os dados da foto selecionada em uma instância de `UIImage`.
    /// 
    /// - Obtém os dados da foto através do `PhotosPickerItem`.
    /// - Se a conversão for bem-sucedida, atualiza a propriedade `image`
    ///   com uma animação suave.
    func convertDataToImage() async {
        if let selectedPhoto,
           let data = try? await selectedPhoto.loadTransferable(type: Data.self) {
            if let uiimage = UIImage(data: data) {
                withAnimation(.easeInOut(duration: 0.5)) {
                    image = uiimage
                }
            }
        }
    }
}
