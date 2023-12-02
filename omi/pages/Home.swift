//
//  Home.swift
//  omi
//
//  Created by kehinde on 26/11/2023.
//

import SwiftUI

struct Home: View {
    @State var searchValue = ""
    func createFormatter()->String {
        let formatter = NumberFormatter();
        
        formatter.numberStyle = NumberFormatter.Style.currencyAccounting;
        
        formatter.locale = Locale(identifier: "US");
        
        formatter.currencyCode = "USD";
        
        
        guard let string = formatter.string(from: 20000) else { return "invalid" };
        
        return string
    }
    
    
    var body: some View {
        VStack{
            ZStack{
                VStack{
                    HStack(alignment: .center , spacing: 5){
                        Image(systemName: "trophy").font(.system(size: 27)).foregroundStyle(.white)
                        Spacer()
                        HStack{
                            Image(systemName: "magnifyingglass").foregroundStyle(.white)
                            ZStack(alignment: .leading){
                                
                                if(searchValue == ""){
                                    Text("Search payments").font(.custom("DMSans-Regular", size: 16)).foregroundStyle(.white)
                                }
                                TextField("" , text : $searchValue).font(.custom("DMSans-Regular", size: 16)).foregroundStyle(.white)
                            }
                        }.padding().background(RoundedRectangle(cornerRadius: 36).fill(Color("LightBlue")))
                        Spacer()
                        Image(systemName: "bell.fill").font(.system(size: 27)).foregroundStyle(.white)
                    }.padding()
                    
                    VStack(spacing: 15){
                        HStack{
                            Text("US Dollar").font(.custom("DMSans-Regular", size: 16)).foregroundStyle(Color("DarkWhite"))
                        }
                        Text(createFormatter()).font(.custom("TomatoGrotesk-Bold", size: 27)).foregroundStyle(.white)
                        Text("Available Balance").font(.custom("DMSans-Regular", size: 16)).foregroundStyle(Color("DarkWhite"))
                        
                        Button(action: {
                            print("ss")
                        }, label: {
                            HStack{
                                Group{
                                    Image(systemName: "wallet.pass.fill")
                                    Text("Add Money").font(.custom("DMSans-Regular", size: 16))
                                }.foregroundStyle(.white)
                            }.padding(10).overlay(RoundedRectangle(cornerRadius: 25).stroke(.white, lineWidth: 1))
                        })                }.padding(.bottom , 90)
                }.background(Color("DarkBlue"))
                
                RoundedRectangle(cornerRadius: 12).fill(.white.shadow(.drop(color: .black, radius: 100))).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/).frame(height: 100).overlay(content: {
                    HStack{
                        VStack(alignment: .center, spacing: 10){
                            Image(systemName: "dollarsign.arrow.circlepath").foregroundStyle(Color("BrandBlue"))
                            Text("Send").font(.custom("DMSans-Regular", size: 14)).foregroundStyle(.gray)
                        }
                        Spacer()
                        VStack(alignment: .center, spacing: 10){
                            Image(systemName: "dollarsign.arrow.circlepath").foregroundStyle(.yellow)
                            Text("Request").font(.custom("DMSans-Regular", size: 14)).foregroundStyle(.gray)
                        }
                        Spacer()
                        VStack(alignment: .center, spacing: 10){
                            Image(systemName: "banknote.fill").foregroundStyle(.yellow)
                            Text("Bank").font(.custom("DMSans-Regular", size: 14)).foregroundStyle(.gray)
                        }
                    }.padding(.horizontal , 50)
                }).offset(x:0,y:170).padding()
            }
            Spacer()
        }.navigationBarBackButtonHidden(true)
    }
}
