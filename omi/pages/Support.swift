//
//  Support.swift
//  omi
//
//  Created by kehinde on 18/12/2023.
//

import SwiftUI

struct Support: View {
    @Binding var currentTab:String
    @Binding var prevPage:String 
    
    var body: some View {
        NavigationStack{
            VStack{
                Text("\(prevPage)")
                Spacer()
                
            }.padding(.horizontal , 20).toolbar{
                ToolbarItem(placement: .topBarLeading, content: {
                    
                    Button(action: {
                        currentTab = prevPage
                    }, label: {
                        Image(systemName: "chevron.backward").foregroundStyle(.black)
                    })
                })
            }.navigationTitle("Support").navigationBarTitleDisplayMode(.inline)
        }
    }
}
