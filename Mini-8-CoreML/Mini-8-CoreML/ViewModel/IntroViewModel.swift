//
//  IntroViewModel.swift
//  Mini-8-CoreML
//
//  Created by Jamile Marian Polycarpo on 22/11/23.
//

import SwiftUI

public class IntroViewModel : ObservableObject {
    @Published var imageTabs: [Tab] = [
        .init(image: "Intro1"),
        .init(image: "Intro2"),
        .init(image: "Intro3"),
    ]
}

