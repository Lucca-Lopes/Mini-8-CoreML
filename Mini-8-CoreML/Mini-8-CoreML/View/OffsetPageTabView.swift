//
//  OffsetPageTabView.swift
//  Mini-8-CoreML
//
//  Created by Jamile Marian Polycarpo on 16/11/23.
//

import SwiftUI

struct InfiniteCarouselView: View {
    @Binding var tabs: [Tab]
    @Binding var currentIndex: Int
    
    @State var fakeIndex: Int = 0
    
    var body: some View{
        
        TabView(selection: $fakeIndex){
            ForEach(tabs){ tab in
                VStack{

                    Image(tab.image)
                        .resizable()
                    Image("cachorro")
                        .resizable()
                }
                
                
            }
            
            
        }
        
    }
    
}

//struct OffsetPageTabView<Content: View> : UIViewRepresentable {
//   
//    
//   
//    var content: Content
//    @Binding var offset: CGFloat
//    
//    func makeCoordinator() -> Coordinator {
//        return OffsetPageTabView.Coordinator(parent: self)
//    }
//    
//    init(offset:Binding<CGFloat> ,@ViewBuilder content: @escaping ()-> Content) {
//        self.content = content()
//        self._offset = offset
//    }
//    
//    
//    func makeUIView(context: Context) -> UIScrollView {
//        
//        let scrollview = UIScrollView()
//        
//        //Extraindo o SwiftuiView e incorporando o UIKit
//        let hostview = UIHostingController(rootView: content)
//        hostview.view.translatesAutoresizingMaskIntoConstraints = false
//        
//        let constrains = [
//            hostview.view.topAnchor.constraint(equalTo: scrollview.topAnchor),
//            hostview.view.leadingAnchor.constraint(equalTo: scrollview.leadingAnchor),
//            hostview.view.trailingAnchor.constraint(equalTo: scrollview.trailingAnchor),
//            hostview.view.bottomAnchor.constraint(equalTo: scrollview.bottomAnchor),
//            hostview.view.heightAnchor.constraint(equalTo: scrollview.heightAnchor)
//        
//        
//        ]
//        
//        scrollview.addSubview(hostview.view)
//        scrollview.addConstraints(constrains)
//        
//      //Enabling Paging
//        scrollview.isPagingEnabled = true
//        scrollview.showsVerticalScrollIndicator = false
//        scrollview.showsHorizontalScrollIndicator = false
//        
//        //Setting Delegate
//        scrollview.delegate = context.coordinator 
//        
//        
//        return scrollview
//    }
//    
//    func updateUIView(_ uiView: UIScrollView,   context: Context) {
//        
//        let currentOffset = uiView.contentOffset.x
//        
//        if currentOffset != offset {
//            uiView.setContentOffset(CGPoint(x: offset, y: 0), animated: true)
//            
//        }
//    }
    // Pager Offset
//    class Coordinator: NSObject, UIScrollViewDelegate{
//        
//        var parent: OffsetPageTabView
//        init(parent: OffsetPageTabView) {
//            self.parent = parent
//        }
//        
//        func scrollViewDidScroll(_ scrollView: UIScrollView) {
//            let offset = scrollView.contentOffset.x
//            
//            parent.offset = offset
//            
//        }
//    }
//}
//
#Preview {
    ContentView()
}

