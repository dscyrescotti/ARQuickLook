//
//  GalleryViewModel.swift
//  ARQuickLook
//
//  Created by Aye Chan on 1/23/22.
//

import Foundation

struct GalleryViewModel {
    let fileName: String
    let title: String
    
    private init(fileName: String, title: String) {
        self.fileName = fileName
        self.title = title
    }
    
    static let teapot = GalleryViewModel.init(fileName: "Teapot", title: "Enjoy your teapot. It will make you warm.")
    static let gramophone = GalleryViewModel.init(fileName: "Gramophone", title: "Chill and listen to some classic music on gramophone.")
    static let pig = GalleryViewModel.init(fileName: "Pig", title: "Save your money inside the secure piggy bank.")
}
