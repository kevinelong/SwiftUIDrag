//
//  ContentView.swift
//  SwiftUIDrag
//
//  Created by Kevin Ernest Long on 8/8/19.
//  Copyright © 2019 Clever Clever Consulting Partners. All rights reserved.
//

import SwiftUI

//extension View {
//    public func offset(by offset: CGPoint) -> ModifiedContent<View, _OffsetEffect>{
//    self.offset(x: offset.x, y: offset.y)
//  }
//}

struct ContentView: View {
    @State private var viewState = CGSize.zero
    @State var gestureStartLocation: CGPoint = .zero
//    @State var lastGestureDirection: GameLogic.Direction = .up
    @State var imageLocation: CGPoint = .zero

    var body: some View {
        Image("log").resizable()
        .position(imageLocation)
//            .offset(by: self.position)
        .frame(width: 32.0, height: 32.0)
            .gesture(
                DragGesture(minimumDistance:10).onChanged { v in
                    print(v)
                    
                    guard self.gestureStartLocation != v.startLocation else { return }
                    print(self.gestureStartLocation)
                    
                    self.imageLocation = v.location
                        
                    withTransaction(Transaction()) {
                        self.gestureStartLocation = v.startLocation
                    }
                    self.setNeedsDisplay()
                }
                .onEnded { value in
                    self.imageLocation = value.location

//                    if self.viewState.height > 200 {
//                        self.viewState = CGSize(width: 0, height: 1200)
//                    } else {
//                        self.viewState = .zero
//                    }
        
            }
        )
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
