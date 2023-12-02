//
//  ContentView.swift
//  omi
//
//  Created by kehinde on 11/11/2023.
//

import SwiftUI


struct ContentView: View {
    @State private var current = 0
    init(current: Int = 0) {
        self.current = current
    }
    var body: some View {
        if(UserDefaults.standard.bool(forKey: onboardKey)){
            Layout()
        }else{
            Onboarding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
