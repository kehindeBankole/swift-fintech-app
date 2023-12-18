//
//  Layout.swift
//  omi
//
//  Created by kehinde on 02/12/2023.
//

import SwiftUI

struct Layout: View {
    @State var currentTab = "home"
    @State var prevTabs:[String] = ["home"]
    
    init(){
        UITabBar.appearance().isHidden = true
    }
    
    
    var body: some View {
        VStack{
            Spacer()
            
            TabView(selection: $currentTab){
                Home()
                Profile().tag("profile")
                Support(currentTab: $currentTab, prevPage: prevTabs.count < 2  ? $currentTab : $prevTabs[prevTabs.count - 2]).tag("support")
                Spacer()
            }.edgesIgnoringSafeArea(.all)
            Spacer()
            Tabs(currentTab: $currentTab , prevTabs: $prevTabs)
        }.edgesIgnoringSafeArea(.all).navigationBarBackButtonHidden(true)
        
    }
}
