//
//  IntroViewModel.swift
//  Mini-8-CoreML
//
//  Created by Jamile Marian Polycarpo on 22/11/23.
//

import SwiftUI

public class IntroViewModel : ObservableObject {
    @Published var imageTabs: [Tab] = [
    Tab(image: "Intro1"),
    Tab(image: "Intro2"),
        Tab(image: "Intro3"),
        Tab(image: "Intro"),
        Tab(image: "tutorial")
    ]
    
    let indexToShow = "Intro"
    let indexDog = 3
    
  func sholdShow(for imageTabs:Tab) -> Bool
    {
        return imageTabs.image == indexToShow
    }
}

