//
//  Login.swift
//  omi
//
//  Created by kehinde on 18/11/2023.
//

import SwiftUI





struct Login: View {
    
    @Environment(\.dismiss) private var dismiss
    @State private var selectedCode = "+234"
    @State var isSelecting = false
    @State var selectedRowId = 0
    @State var text = ""
    @State var value = ""
    @State var showPassword = false
    @State private var data: [DropdownItem] = [
        DropdownItem(id:1,title: "+234"),
        DropdownItem(id:2,title: "+112")
    ]
    
    var body: some View {
        
        NavigationStack{
            HStack{
                VStack{
                    
                    VStack(alignment: .leading){
                        
                        VStack(alignment:  .leading , spacing: 10){
                            Text("Log in to coinpay").fontWeight(.bold).font(.custom("TomatoGrotesk-Bold", size: 27)).fontWeight(.bold)
                            Text("Enter your registered mobile number to log in.").font(.custom("DMSans-Regular", size: 16)).foregroundColor(.gray)
                            
                        }.padding(.bottom , 20)
                        Text("Phone").font(.custom("TomatoGrotesk-Bold", size: 16)).foregroundStyle(.gray)
                        HStack(alignment: .top){
                            VStack{
                                Dropdown(selectedValue: $selectedCode, isSelecting: $isSelecting, selectedRowId: $selectedRowId , data: $data)
                            }.frame(width: 100)
                            
                            TextField("Mobile number", text: $text)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).stroke(.gray, lineWidth: 1)).frame(minWidth: 0, maxWidth: .infinity).font(.custom("DMSans-Regular", size: 16)).foregroundColor(.gray).keyboardType(.phonePad)
                            
                        }.padding(.bottom , 20)
                        
                        VStack(alignment: .leading){
                            Text("Password").font(.custom("TomatoGrotesk-Bold", size: 16)).foregroundStyle(.gray)
                            
                            HStack(alignment: .top) {
                                Image(systemName: "lock.circle")
                                    .resizable()
                                    .frame(width: 24, height: 24).foregroundColor(.gray)
                                TextField("", text: $value)
                                Button(action: {
                                    showPassword.toggle()
                                }, label: {
                                    Image(systemName: showPassword ? "eye.circle" : "eye.slash")
                                        .resizable()
                                        .frame(width: 24, height: 24).foregroundColor(.gray)
                                })
                            }
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.gray, lineWidth: 1)
                            )
                            
                            NavigationLink(destination: ForgotPassword(), label: {
                                Text("Forgot password?").font(.custom("TomatoGrotesk-Bold", size: 12)).foregroundStyle(Color("BrandBlue")).padding(.top , 5)
                            })
                            
                            
                        }
                        
                        NavigationLink(destination: Home(), label: {
                            Text( "Log in").padding(20).foregroundColor(.white).fontWeight(.bold).contentShape(Rectangle()).frame(maxWidth: .infinity).buttonStyle(PlainButtonStyle()).background(Color("BrandBlue")).cornerRadius(16)
                            
                        }).padding(.top , 40)
                        Spacer()
                    }.padding(.top , 30)
                    
                    
                }.navigationBarBackButtonHidden(true).toolbar{
                    ToolbarItem(placement: .topBarLeading){
                        HStack {
                            Button(action: {
                                dismiss()
                            }) {
                                Image(systemName: "chevron.left").foregroundColor(.black)
                                    .imageScale(.large)
                            }
                        }
                    }
                }.padding()
                Spacer()
            }
            
            
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
