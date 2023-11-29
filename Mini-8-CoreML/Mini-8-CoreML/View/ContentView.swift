//
//  ContentView.swift
//  Mini-8-CoreML
//
//  Created by Lucca Lopes on 31/10/23.
//

import SwiftUI

struct ContentView: View {
    @State var introPresented: Bool? = UserDefaults.standard.bool(forKey: "hasShowTutorial")
    
    init(){
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(Color("labelColor")), .font: UIFont.systemFont(ofSize: 30, weight: .bold)]
    }
   
    
    var body: some View {
        NavigationStack{
//            LiveCamView()
//            IntroView(introPresented: $introPresented)            
            if let presented = introPresented {
                if presented{
                    CameraView()
                } else {
                    IntroView(introPresented: $introPresented)
                }
                
            }
//            CameraView()
//            CapturedImageView(image: Image("cachorro"), photo: UIImage(named: "cachorro")!, disease: "", accuracy: "", description: "", recommendations: "")
               
        } .navigationBarBackButtonHidden(true)
    }
}

//#Preview {
//    ContentView()
//}
