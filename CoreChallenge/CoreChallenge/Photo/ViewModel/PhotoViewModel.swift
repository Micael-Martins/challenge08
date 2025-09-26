//
//  PhotoViewModel.swift
//  CoreChallenge
//
//  Created by Thiago de Jesus on 26/09/25.
//

import Foundation
import UIKit
import SwiftUI
import PhotosUI

@Observable
class PhotoViewModel {
    
    var image: UIImage?
    var selectedPhoto: PhotosPickerItem?
    var domestic: Bool = true
    
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
