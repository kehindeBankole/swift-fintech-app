//
//  Tabs.swift
//  omi
//
//  Created by kehinde on 02/12/2023.
//

import SwiftUI

struct Tabs: View {
    @Binding var currentTab:String
    let tabs = ["home" , "spending" , "scan" ,  "support" , "profile" ]
    let myDictionary = ["home": "house" , "profile":"person.crop.circle" , "spending":"chart.pie.fill" , "support":"message" , "scan":"qrcode.viewfinder"]
    
    var body: some View {
        HStack{
            Spacer()
            ForEach(tabs , id:\.self){ tab in
           
                Button{
                    currentTab = tab
                    print(tab)
                }label:{
                    VStack{
                        Image(systemName: myDictionary[tab] ?? "").foregroundColor(currentTab == tab ? Color("BrandBlue") : .black).font(.system(size:25))
                        if(tab == currentTab){
                            Circle().frame(width: 5,height: 5)
                        }
                    }
                }
                Spacer()
                
            }
        }.frame(maxWidth: .infinity).frame(height:30)
            .padding(.vertical,40)
    }
}
