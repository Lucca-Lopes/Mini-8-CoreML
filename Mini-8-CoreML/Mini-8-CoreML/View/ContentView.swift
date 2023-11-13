//
//  ContentView.swift
//  Mini-8-CoreML
//
//  Created by Lucca Lopes on 31/10/23.
//

import SwiftUI

struct ContentView: View {
    
    init(){
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(Color("labelColor"))]
    }
    
    var body: some View {
        NavigationStack{
            InfoView()
        }
    }
}

//#Preview {
//    ContentView()
//}
