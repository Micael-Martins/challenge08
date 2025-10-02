//
//  PhotoViewModel.swift
//  CoreChallenge
//
//  Created by Thiago de Jesus on 26/09/25.
//

import UIKit
import SwiftUI
import PhotosUI
import C08_Package_G1

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
    
    var imageIsSelected: Bool = false
    
    /// Indicador se o animal detectado é doméstico (`true`) ou não (`false`).
    var domestic: ResponseAnalyze?
    
    ///indica se o texto deve aparecer ou não
    var isVisible: Bool = false
    
    var isDetailsVisible: Bool = false
    
    var feed: String = ""
    var careTips: String = ""
    
    /// Converte os dados da foto selecionada em uma instância de `UIImage`.
    /// 
    /// - Obtém os dados da foto através do `PhotosPickerItem`.
    /// - Se a conversão for bem-sucedida, atualiza a propriedade `image`
    ///   com uma animação suave.
    func convertDataToImage() async {
        print("cheguei boy")
        if let selectedPhoto,
           let data = try? await selectedPhoto.loadTransferable(type: Data.self) {
            if let uiimage = UIImage(data: data) {
                withAnimation(.easeInOut(duration: 0.5)) {
                    image = uiimage
                }
            }
        }
    }
    
    
//    func generateDetailsData(animal: String) {
//        var info: InformacoesPet?
//        Task {
//            guard let info = try await PetCareInfoGenerator.fetchAndPrintCareInfo(for: animal) else { return }
//        }
//        self._feed = info?.alimentos.joined(separator: ", ") ?? "não encontrei os alimentos"
//        self._careTips = info?.cuidados ?? "Nao encontrei os cuidados"
//    }
    func generateDetailsData(animal: String) async {
            do {
                let info = try await PetCareInfoGenerator.fetchAndPrintCareInfo(for: animal)
                feed = info!.alimentos.joined(separator: ", ")
                careTips = info!.cuidados
            } catch {
                feed = "Não foi possível encontrar informações de alimentos."
                careTips = "Não foi possível encontrar dicas de cuidados."
                print("Erro ao buscar detalhes do animal: \(error)")
            }
        }
}
