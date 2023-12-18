//
//  Signup.swift
//  omi
//
//  Created by kehinde on 25/11/2023.
//

import SwiftUI

struct Signup: View {
    var body: some View {
            NavigationStack{
                ScrollView(showsIndicators: false){
                    VStack(spacing: 30){
                        VStack(alignment: .center){
                            Image("signup-image").resizable()
                                .scaledToFill()
                                .frame(width: 300, height: 300)
                            Text("Create your own Coinpay account").fontWeight(.bold).multilineTextAlignment(.center).padding([.top] , 50).font(.custom("TomatoGrotesk-Bold", size: 37)).fontWeight(.bold)
                            Text("coinpay is a powerfull tool that allows you to easily send , receive and track all  your transactions").padding([.top] , 10).font(.custom("DMSans-Regular", size: 17))
                            
                        }.multilineTextAlignment(.center)
                        
                        VStack(spacing: 20){
                            Button(action: {
                                
                            } , label:{
                                Text("Sign up").padding().font(.custom("DMSans-Bold" , size : 16 )).foregroundColor(.white)
                            }).contentShape(Rectangle()).frame(maxWidth: .infinity).buttonStyle(PlainButtonStyle()).background(Color("BrandBlue")).cornerRadius(16)
                            
                            
                            NavigationLink(destination: Login(), label: {
                                    HStack {
                                        Text("Log in").font(.custom("DMSans-Bold" , size : 16 ))
                                        
                                    }
                                    .frame(minWidth: 0, maxWidth: 300)
                                    .padding()
                                    .foregroundColor(Color("BrandBlue"))
                                    .overlay(
                                        RoundedRectangle(cornerRadius:16)
                                            .stroke(Color("BrandBlue"), lineWidth: 2)
                                    )
                            })
                        }.padding(50)
                        Spacer()
                    }.navigationBarBackButtonHidden(true)
                }

        }
    }
}

#Preview {
    Signup()
}
