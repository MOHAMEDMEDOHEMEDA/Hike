//
//  MotionAnimationView.swift
//  hike
//
//  Created by Mohamed Magdy on 03/09/2023.
//

import SwiftUI

struct MotionAnimationView: View {
    
    //MARK: - properties
    
    @State private var randomCircle : Int = Int.random(in: 6...12)
    
    @State private var isAnimating : Bool = false
    //MARK: - functions
    
    //random coordinate
    func randomCoordinte() -> CGFloat {
        return CGFloat.random(in: 0...256)
    }
    
    //random size
    func randomSize() -> CGFloat {
        return CGFloat.random(in: 0...80)
    }
    
    
    //ramdom scale
    func randomScale() -> CGFloat {
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    
    //random speed
    func randomSpeed() -> Double {
        return Double.random(in: 0.05...1.0)
    }
    //random delay
    func randomDelay() -> Double {
        return Double.random(in: 0...2)
    }
    
    
    
    var body: some View {
        ZStack{
            ForEach(0...randomCircle,id: \.self) { item in
                Circle()
                    .foregroundColor(.white)
                    .opacity(0.25)
                    .frame(width: randomSize())
                    .position(
                        x:randomCoordinte(),
                        y:randomCoordinte()
                    )
                    .scaleEffect(isAnimating ? randomScale() : 1)
                    .onAppear(perform: { withAnimation(
                        .interpolatingSpring(stiffness: 0.25, damping: 0.25)
                        .repeatForever()
                        .speed(randomSpeed())
                        .delay(randomDelay())
                    ){
                        isAnimating = true
                    }
                    })
                
            }
            .frame(width: 256,height: 256)
            .mask(Circle())
            .drawingGroup()
            
        }
    }
    
    struct MotionAnimationView_Previews: PreviewProvider {
        static var previews: some View {
            ZStack{
                MotionAnimationView()
                    .background {
                        Circle()
                            .fill(.teal)
                    }
            }
        }
    }
}
