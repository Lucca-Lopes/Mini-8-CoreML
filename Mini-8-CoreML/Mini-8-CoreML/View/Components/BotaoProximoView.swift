//
//  BotaoProximoView.swift
//  Mini-8-CoreML
//
//  Created by Jamile Marian Polycarpo on 13/11/23.
//

import SwiftUI

struct BotaoProximoView: View {
  
    @Environment (\.screenSize) var screenSize
    var body: some View {
   
        
            ZStack{
              
                    
                Text("Próximo")
                    .font(.system(size: 16))
                    .fontWeight(.semibold)
                    .foregroundColor(Color("labelColor"))
                    .background(
                        RoundedRectangle(cornerRadius: 40)
                            .fill(Color("AccentColor"))
                            .frame(width: screenSize.width * 0.3, height: screenSize.height * 0.05)
                    )
            }
        }
    }


//#Preview {
//    BotaoProximoView()
//}
