//
//  Layout.swift
//  omi
//
//  Created by kehinde on 02/12/2023.
//

import SwiftUI

struct Layout: View {
    @State var currentTab = "support"
    
    init(){
        UITabBar.appearance().isHidden = true
    }
    
    
    var body: some View {
        VStack{
            Spacer()
            TabView(selection: $currentTab){
                Home()
                Profile().tag("profile")
                Support().tag("support")
                Spacer()
            }.edgesIgnoringSafeArea(.all)
            Spacer()
            Tabs(currentTab: $currentTab)
        }.edgesIgnoringSafeArea(.all).navigationBarBackButtonHidden(true)
        
    }
}
