//
//  cardView.swift
//  hike
//
//  Created by Mohamed Magdy on 28/07/2023.
//

import SwiftUI

struct cardView: View {
    //MARK: - properties
    
    @State private var randomNum : Int = 1
    @State private var imageNum : Int = 1
    @State private var isShowingSheet: Bool = false
    
    //MARK: - functions
    
    
    func randomImage(){
        repeat{
            randomNum=Int.random(in: 1...5)
            
        }while randomNum == imageNum
        
        imageNum=randomNum
        
    }
    
    var body: some View {
        ZStack {
            CustomBackgroundView()
            
            
            VStack {
                //MARK: - HEADER
                
                
                VStack(alignment: .leading){
                    
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                            .foregroundStyle(
                                LinearGradient(colors:[.customGrayLight,.customGrayMedium], startPoint: .top, endPoint: .bottom))
                        
                        Button{
                            print("the button was pressed.")
                            isShowingSheet.toggle()
                            
                        }label:{
                            CustomButtonView()
                            
                        }
                        .sheet(isPresented: $isShowingSheet) {
                            Settingsview()
                                .presentationDragIndicator(.visible)
                                .presentationDetents([.medium,.large])
                            
                        }
                        
                    }
                    
                    
                    Text("Fun and enjoyable outdoor activity for friends and families. ")
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundColor(.customGrayMedium)
                    
                    
                    
                }.padding(.horizontal,30)
                
                
                
                
                //MARK: - MainContent
                ZStack {
                    CustomCircleView()
                    Image("image-\(imageNum)")
                        .resizable()
                        .scaledToFit()
                        .animation(.easeOut(duration: 1), value: imageNum)
                    
                }
                //MARK: - footer
                
                Button{
                    // Action:- generate a random number
                    
                    randomImage()
                    
                    
                } label: {
                    Text("explore more")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(LinearGradient(colors: [.customGreenLight,.customGreenMedium], startPoint: .top, endPoint: .bottom)
                        )
                        .shadow(color: .black.opacity(1), radius: 0.25,x: 2,y: 2)
                }
                .buttonStyle(GradiantButton())
                
            }
            
        }
        .frame(width: 320,height: 570)
        
    }
}

struct cardView_Previews: PreviewProvider {
    static var previews: some View {
        cardView()
    }
}
