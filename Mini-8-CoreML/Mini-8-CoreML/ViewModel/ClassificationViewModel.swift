//
//  ClassificationViewModel.swift
//  Mini-8-CoreML
//
//  Created by Lucca Lopes on 09/11/23.
//

import Foundation
struct Tab: Identifiable, Hashable {
    
    var id: String = UUID().uuidString
    var image: String
    
}
    
    var imageTabs: [Tab] = [
        .init(image: "Intro1"),
        .init(image: "Intro2"),
        .init(image: "Intro3"),
        
    ]
    
