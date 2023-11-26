//
//  Onboarding.swift
//  omi
//
//  Created by kehinde on 11/11/2023.
//

import SwiftUI

struct Onboarding: View {
    @State private var current = 0
    @Environment(\.colorScheme) var colorScheme
    init() {
        UIScrollView.appearance().bounces = false
    }
    var body: some View {
        NavigationStack{
            VStack{
             
                HStack{
                    Spacer()
                    Button(action: {
                        withAnimation{
                            current = OnboardStep.count - 1
                        }
                    }){
                        Text("Skip").font(.custom("DMSans-Regular", size: 16))

                    }
                }
                TabView(selection: $current, content: {
                    ForEach(0..<OnboardStep.count , id: \.self){step in
                        VStack(alignment: .center) {
                            Image(OnboardStep[step].image)
                            
                            Text(OnboardStep[step].title).fontWeight(.bold).multilineTextAlignment(.center).padding([.top] , 50).font(.custom("TomatoGrotesk-Bold", size: 27)).fontWeight(.bold)
                            
                            Text(OnboardStep[step].subtitle).multilineTextAlignment(.center).padding([.top] , 10).font(.custom("DMSans-Regular", size: 17))
                            
                        }
                        .tag(step)
                    }
                    
                }).tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                
                
                if(current != OnboardStep.count-1){
                    Button(action: {
                            withAnimation{
                                current += 1
                            }
                        
                    } , label:{
                        Text(current==OnboardStep.count-1 ? "Log in": "Next").padding(16).foregroundColor(.white).fontWeight(.bold)
                    }).contentShape(Rectangle()).frame(maxWidth: .infinity).buttonStyle(PlainButtonStyle()).background(Color("BrandBlue")).cornerRadius(16)

                }else{
                    NavigationLink(destination: Signup(), label: {
                        Text( "Log in").padding(16).foregroundColor(.white).fontWeight(.bold).contentShape(Rectangle()).frame(maxWidth: .infinity).buttonStyle(PlainButtonStyle()).background(Color("BrandBlue")).cornerRadius(16)
                
                    }).simultaneousGesture(TapGesture().onEnded {
                        UserDefaults.standard.set(true, forKey: onboardKey)
                    })

                }
             
            }
            .padding().background(colorScheme == .dark ? .black : .white)
        }
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
