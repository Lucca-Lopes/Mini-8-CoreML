//
//  LiveCamView.swift
//  Mini-8-CoreML
//
//  Created by Lucca Lopes on 29/11/23.
//

import SwiftUI

struct LiveCamView: View {
    @Environment (\.screenSize) var screenSize
    @StateObject var vm = ClassificationViewModel()
    @StateObject var photoVm = LiveCamViewController()
    var body: some View {
        ZStack{
          
                HostedViewController()
                    .environmentObject(vm)
                
            
                .overlay{
                    
                    VStack{
                        //nome da doença e acurácia
                        HStack(alignment: .center){
                            Text(vm.classification)
                                .font(.system(size: 22, weight: .semibold))
                                .foregroundColor(Color("labelColor"))
                            
                            Spacer()
                            
                            Text("\(vm.accuracy)%")
                                .font(.system(size: 22, weight: .semibold))
                                .foregroundColor(Color("labelColor"))
                                .accessibilityLabel("\(vm.accuracy) de acurácia")
                            
                            
                            Image(systemName: "pawprint")
                                .font(.system(size: 22, weight: .semibold))
                                .foregroundStyle(Color("labelColor"))
                            
                        }
                        
                        
                        Divider()
                            .background(Color("labelColor"))
                           
                    }
                  
                   
                }
                
            } .ignoresSafeArea()
            
        }
           
    }

