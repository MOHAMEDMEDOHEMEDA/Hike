//
//  CustomListView.swift
//  hike
//
//  Created by Mohamed Magdy on 04/09/2023.
//

import SwiftUI

struct CustomListView: View {
    
    //MARK: - properties
    
    @State var rowLabel : String
    @State var rowIcon : String
    @State var rowcontent : String? = nil
    @State var rowTintColor : Color
    @State var rowLinkLabel : String? = nil
    @State var rowLinkDestination : String? = nil

    
    var body: some View {
        LabeledContent{
            if rowcontent != nil {
                Text(rowcontent!)
                    .foregroundColor(.primary)
                .fontWeight(.heavy)
            }
            else if (rowLinkLabel != nil && rowLinkDestination != nil){
                Link(rowLinkLabel!, destination: URL(string: rowLinkDestination!)!)
                    .foregroundColor(.pink)
                    .fontWeight(.heavy)
                
            }
            else {
                EmptyView()
            }
        }label: {
            HStack{
                ZStack{
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 30,height: 30)
                        .foregroundColor(rowTintColor)
                        Image(systemName: rowIcon)
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                }
               
                Text(rowLabel)

            }
        }    }
}

struct CustomListView_Previews: PreviewProvider {
    static var previews: some View {
        List {
            CustomListView(rowLabel: "website",
                           rowIcon: "globe",
                           rowcontent: nil ,
                           rowTintColor: .pink,
                           rowLinkLabel: "credo academy",
                           rowLinkDestination: "https://credo.academy"
            )
        }
    }
}
