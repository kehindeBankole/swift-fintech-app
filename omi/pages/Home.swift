//
//  Home.swift
//  omi
//
//  Created by kehinde on 26/11/2023.
//

import SwiftUI

enum Title:String {
    case Spending
    case Income
    case Bills
    case Savings
}

struct TransactionModel : Hashable{
    let image:String
    let title:Title
    let amount:Int
}

let Transaction = [TransactionModel(image: "creditcard", title: Title.Spending, amount: 500),
                   TransactionModel(image: "square.stack", title: Title.Income, amount: 3000),
                   TransactionModel(image: "book.closed", title: Title.Bills, amount: 800),
                   TransactionModel(image: "bag.badge.plus.fill", title: Title.Savings, amount: 800),
                   TransactionModel(image: "bag.badge.plus.fill", title: Title.Savings, amount: 800),
]
struct Home: View {
    @State var searchValue = ""
    func createFormatter(amount : Int)->String {
        let formatter = NumberFormatter();
        
        formatter.numberStyle = NumberFormatter.Style.currencyAccounting;
        
        formatter.locale = Locale(identifier: "US");
        
        formatter.currencyCode = "USD";
        
        
        guard let string = formatter.string(from: amount as NSNumber) else { return "invalid" };
        
        return string
    }
    
    func getColor(transaction:TransactionModel) -> Color{
        switch(transaction.title){
        case .Spending:
            return .red
        case .Income:
            return  .blue
        case .Bills:
            return .yellow
        case .Savings:
            return   .green
        }
    }
    
    var body: some View {
        GeometryReader{
            proxy in
            
            
            ScrollView(showsIndicators:false){
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
                                Text(createFormatter(amount:20000)).font(.custom("TomatoGrotesk-Bold", size: 27)).foregroundStyle(.white)
                                Text("Available Balance").font(.custom("DMSans-Regular", size: 16)).foregroundStyle(Color("DarkWhite"))
                                
                                Button(action: {
                                
                                }, label: {
                                    HStack{
                                        Group{
                                            Image(systemName: "wallet.pass.fill")
                                            Text("Add Money").font(.custom("DMSans-Regular", size: 16))
                                        }.foregroundStyle(.white)
                                    }.padding(10).overlay(RoundedRectangle(cornerRadius: 25).stroke(.white, lineWidth: 1))
                                })                }.padding(.bottom , 90)
                        }.padding(.top,proxy.safeAreaInsets.top).background(Color("DarkBlue"))
                        
                        RoundedRectangle(cornerRadius: 12).fill(.white).frame(maxWidth: .infinity
                                                                              
                                                                              
                        ).frame(height: 100).overlay(content: {
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
                        }).offset(x:0,y:200).padding()
                    }
                    
                    
                    VStack{
                        HStack{
                            Text("Transaction").font(.custom("TomatoGrotesk-Bold", size: 20))
                            Spacer()
                            Image(systemName: "arrowshape.right.fill")
                            
                        }.padding(.bottom , 10)
                        
                        VStack{
                            ForEach(Transaction , id:\.self) { transaction in
                                HStack{
                                    HStack(spacing:15){
                                        Circle().fill(getColor(transaction: transaction)).opacity(0.1).overlay(content: {
                                            Image(systemName: transaction.image).foregroundStyle(getColor(transaction: transaction))
                                        }).frame(width: 40 , height: 40)
                                        
                                        Text(transaction.title.rawValue).font(.custom("DMSans-Regular", size: 16))
                                    }
                                    Spacer()
                                    Text("\(createFormatter(amount: transaction.amount))").foregroundStyle(getColor(transaction: transaction))
                                }.padding(.bottom,20)
                            }
                        }.padding().background(.white).cornerRadius(23)
                        
                    }.padding(.top , 80).padding(.horizontal , 20)
                }
                Spacer()
                
            }.navigationBarBackButtonHidden(true).background(Color("DarkWhite")).ignoresSafeArea(edges: .all)
        }
    }
}
