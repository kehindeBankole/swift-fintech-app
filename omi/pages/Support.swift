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
            ScrollView(showsIndicators: false){
                VStack{
                    Image("twenty-four")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 300, height: 300)
                    Text("CoinPay Support").fontWeight(.bold).multilineTextAlignment(.center).padding([.top] , 50).font(.custom("TomatoGrotesk-Bold", size: 37)).fontWeight(.bold)
                    Text("our dedicated team is here to assis you with any questions or issues related to your Coinpay mobile app").font(.custom("DMSans-Regular", size: 17)).multilineTextAlignment(.center).padding([.top] ,-15)
                    Spacer()
                    
                    VStack(spacing: 25){
                        RoundedRectangle(cornerRadius: 45).fill(Color("DarkBlue")).overlay(content: {
                            Button(action: {
                                
                            }){
                                HStack{
                                    Image(systemName: "message.fill").foregroundStyle(.white).font(.system(size: 26))
                                    Text("Start Chat").foregroundStyle(.white).font(.custom("DMSans-Bold" , size : 16 ))
                                }
                            }
                        }).frame(height: 60)
                       
                        
                        RoundedRectangle(cornerRadius: 45).stroke(Color("DarkBlue")).overlay(content: {
                            Button(action: {
                                
                            }){
                                HStack{
                                    Image(systemName: "questionmark.circle").foregroundStyle(Color("DarkBlue")).font(.system(size: 26))
                                    Text("View FAQ").foregroundStyle(Color("DarkBlue")).font(.custom("DMSans-Bold" , size : 16 ))
                                }
                            }
                        }).frame(height: 60)
                    }.padding(.top,50)
                }
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
