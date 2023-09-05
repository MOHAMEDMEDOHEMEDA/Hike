//
//  Settingsview.swift
//  hike
//
//  Created by Mohamed Magdy on 04/09/2023.
//

import SwiftUI

struct Settingsview: View {
    
    //MARK: - properties
    
    private let alternateAppIcons : [String] = [
    "AppIcon-Backpack",
    "AppIcon-Camera",
    "AppIcon-Campfire",
    "AppIcon-MagnifyingGlass",
    "AppIcon-Map",
    "AppIcon-Mushroom"

    ]
    
    var body: some View {
        List {
            // MARK: - section: header
            
            Section{
                
                HStack{
                    Spacer()
                    Image(systemName: "laurel.leading")
                        .font(.system(size: 80,weight: .black))
                    
                    VStack (spacing: -10){
                        Text("Hike")
                            .font(.system(size: 66,weight: .black))
                        
                        Text("Editors' choice")
                            .fontWeight(.medium)
                    }
                    
                    Image(systemName: "laurel.trailing")
                        .font(.system(size: 80,weight: .black))
                    Spacer()
                }
                .foregroundStyle(
                    LinearGradient(colors: [.customGreenLight,.customGreenMedium,.customGreenDark],
                                   startPoint: .top,
                                   endPoint: .bottom
                                   
                                  )
                )
                .padding(.top , 8)
                
                VStack(spacing: 8) {
                    Text("Where can you find \nperfect tracks?")
                        .font(.title2)
                    .fontWeight(.heavy)
                    
                    Text("the hike which looks gorgeous in photos but is even better once you are actually there. the hike that you hope to do again someday. \nfind the best day hikes in the app.")
                        .font(.footnote)
                        .italic()
                    
                    Text("dust off the boots! it's time for a walk. ")
                        .fontWeight(.heavy)
                        .foregroundColor(.customGreenMedium)
                }
                .multilineTextAlignment(.center)
                .padding(.bottom, 16)
                .frame(maxWidth: .infinity)
                
               
            }
            .listRowSeparator(.hidden)
            
            // MARK: - section: icons
            
            Section(header: Text("alternate icons")){
                ScrollView(.horizontal,showsIndicators: false){
                    HStack(spacing: 12){
                        ForEach(alternateAppIcons.indices,id: \.self) { item in
                            Button{
                                print(alternateAppIcons[item])
                                UIApplication.shared.setAlternateIconName(alternateAppIcons[item]){error in
                                    if error != nil{
                                        print("failed request to update app icon : \(String(describing: error?.localizedDescription))")

                                    }
                                    else{
                                        print("you have succefully changed the app icon to : \(alternateAppIcons[item])")
                                    }
                                    
                                }
                            }label: {
                                Image("\(alternateAppIcons[item])-Preview")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80,height: 80)
                                    .cornerRadius(16)
                        }
                            .buttonStyle(.borderless)
                        }
                    }
                    
                }
                .padding(.top,12)
                
                
               Text("choose alternate app icon from the collection above")
                    .frame(minWidth: 0,maxWidth: .infinity)
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.bottom,12)
            }
            .listRowSeparator(.hidden)
            
            
            
            
            // MARK: - section: about
            
            Section(
                header: Text("about app"),
                footer: HStack{
                    Spacer()
                    Text("copyright © all right reserved")
                    Spacer()
                }
                    .padding(.vertical,8)
                
            ){
                
                CustomListView(rowLabel: "Application", rowIcon: "apps.iphone", rowcontent: "Hike", rowTintColor: .blue)
                CustomListView(rowLabel: "Compatibility", rowIcon: "info.circle", rowcontent: "IOS ,ipadOS", rowTintColor: .red)
                CustomListView(rowLabel: "Technology", rowIcon: "swift", rowcontent: "swift", rowTintColor: .orange)
                
                CustomListView(rowLabel: "Version", rowIcon: "gear", rowcontent: "1.0", rowTintColor: .purple)
                
                CustomListView(rowLabel: "Developer", rowIcon: "ellipsis.curlybraces", rowcontent: "Mohamed Magdy", rowTintColor: .mint)
                CustomListView(rowLabel: "Designer", rowIcon: "paintpalette", rowcontent: "Mohamed Magdy", rowTintColor: .pink)
                CustomListView(rowLabel:"website", rowIcon: "globe", rowcontent: nil, rowTintColor: .indigo, rowLinkLabel: "credo academy", rowLinkDestination: "https://credo.academy")
               
            }
            
            


        }
        
    }
}

struct Settingsview_Previews: PreviewProvider {
    static var previews: some View {
        Settingsview()
    }
}
