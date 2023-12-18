//
//  Support.swift
//  omi
//
//  Created by kehinde on 18/12/2023.
//

import SwiftUI

struct Support: View {
    
    var body: some View {
        NavigationStack{
            VStack{
                
                Spacer()
                
            }.padding(.horizontal , 20).toolbar{
                ToolbarItem(placement: .topBarLeading, content: {
                    
                    Button(action: {
                        //go back to
                    }, label: {
                        Image(systemName: "chevron.backward").foregroundStyle(.black)
                    })
                })
            }.navigationTitle("Support").navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    Support()
}
