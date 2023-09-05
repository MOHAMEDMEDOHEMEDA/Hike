//
//  GradientStyle.swift
//  hike
//
//  Created by Mohamed Magdy on 14/08/2023.
//

import Foundation
import SwiftUI

struct GradiantButton : ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
        
            .padding(.vertical)
            .padding(.horizontal,30)
            .background(
                
                configuration.isPressed ?
                
                LinearGradient(colors: [.customGrayMedium,.customGrayLight], startPoint: .top, endPoint: .bottom)
                
                :
                
                
                LinearGradient(colors: [.customGrayLight,.customGrayMedium], startPoint: .top, endPoint: .bottom)
            )
            .cornerRadius(40)
    }
}
