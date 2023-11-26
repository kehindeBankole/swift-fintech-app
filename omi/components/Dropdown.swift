//
//  Dropdown.swift
//  omi
//
//  Created by kehinde on 25/11/2023.
//

import SwiftUI


struct DropdownItem : Hashable{
    let id :Int
    let title: String
}


struct DropdownMenuItemView: View {
    
    let item: DropdownItem
    @Binding var isSelecting: Bool
    @Binding var selectiontitle: String
    @Binding var selectionId: Int
    
    var body: some View {
        Button(action: {
            isSelecting = false
            selectiontitle = item.title
            selectionId = item.id
            
        }) {
            HStack {
                Image(systemName: "checkmark")
                    .font(.system(size: 14, weight: .bold))
                    .opacity(selectionId == item.id ? 1 : 0)
                Text(item.title)
                    .font(.custom("TomatoGrotesk-Bold", size: 16)).fontWeight(.bold)
                Spacer()
            }
            .padding(.horizontal)
            .foregroundColor(.white)
        }
    }
}


struct Dropdown: View {
    @Binding var selectedValue: String
    @Binding var isSelecting: Bool
    @Binding var selectedRowId :Int
    @Binding var data:[DropdownItem]
    
    var body: some View {
        
        VStack {
            HStack {
                Text(selectedValue)
                    .font(.custom("TomatoGrotesk-Bold", size: 16)).fontWeight(.bold)
                
                Spacer()
                Image(systemName: "chevron.down")
                    .font(.system(size: 16, weight: .semibold)).rotationEffect(.degrees(isSelecting ? -180 : 0))
                
            }
            .padding(.horizontal)
            .foregroundColor(.white)
            if isSelecting {
                Divider()
                    .background(.white)
                    .padding(.horizontal)
                
                VStack(spacing: 10) {
                    ForEach(data , id:\.self){ item in
                        DropdownMenuItemView(item: item, isSelecting: $isSelecting, selectiontitle: $selectedValue, selectionId: $selectedRowId )
                    }
                    
                }
                
                
            }
            
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical)
        .background(Color(uiColor: UIColor.systemIndigo))
        .cornerRadius(5)
        .fixedSize()
        .onTapGesture {
            withAnimation{
                isSelecting.toggle()
            }
        }.onAppear{
            selectedValue = "+234"
            selectedRowId = 1
        }
    }
    
}
