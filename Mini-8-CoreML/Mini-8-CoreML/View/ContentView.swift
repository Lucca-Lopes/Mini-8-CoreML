//
//  ContentView.swift
//  Mini-8-CoreML
//
//  Created by Lucca Lopes on 31/10/23.
//

import SwiftUI

struct ContentView: View {
    
//    init(){
//        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(Color("labelColor")), .font: UIFont.systemFont(ofSize: 30, weight: .bold)]
//    }
    
    var body: some View {
        NavigationStack{
            CameraView()
//            CapturedImageView(image: Image("cachorro"), photo: UIImage(named: "cachorro")!, disease: "", accuracy: "", description: "", recommendations: "")
        }
    }
}

//#Preview {
//    ContentView()
//}
