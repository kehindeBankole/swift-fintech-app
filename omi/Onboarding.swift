//
//  Onboarding.swift
//  omi
//
//  Created by kehinde on 11/11/2023.
//

import SwiftUI

struct Onboarding: View {
    @State private var current = 0
    init() {
        UIScrollView.appearance().bounces = false
    }
    var body: some View {
        VStack{
         
            HStack{
                Spacer()
                Button(action: {
                    withAnimation{
                        current = OnboardStep.count - 1
                    }
                }){
                    Text("Skip")
                }
            }
            TabView(selection: $current, content: {
                ForEach(0..<OnboardStep.count , id: \.self){step in
                    VStack(alignment: .center) {
                        Image(OnboardStep[step].image)
                            .resizable()
                            .scaledToFit()
                        
                        Text(OnboardStep[step].title).fontWeight(.bold).multilineTextAlignment(.center).padding([.top] , 50).font(.custom("DMSans-Bold", size: 27)).fontWeight(.bold)
                        
                        Text(OnboardStep[step].subtitle).fontWeight(.bold).multilineTextAlignment(.center).padding([.top] , 10).font(.custom("Raleway-Regular", size: 17))
                        
                    }
                    .tag(step)
                }
                
            }).tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            Button(action: {
                if(current != OnboardStep.count-1){
                    withAnimation{
                        current += 1
                    }
                }
                
            } , label:{
                Text(current==OnboardStep.count-1 ? "Log in": "Next").padding(16).foregroundColor(.white).fontWeight(.bold)
            }).contentShape(Rectangle()).frame(maxWidth: .infinity).buttonStyle(PlainButtonStyle()).background(Color("BrandBlue")).cornerRadius(16)
        }
        .padding()
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
