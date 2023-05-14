//
//  MTAfterView.swift
//  County
//
//  Created by Aleksandra Nikiforova on 19/04/23.
//

import SwiftUI

struct AfterView: View {
    var body: some View {
        VStack(alignment: .center) {
            Text("Good game!")
                .foregroundColor(.black)
                .font(.system(size: 28, weight: .semibold, design: .rounded))
                .padding()
            
            VStack(alignment: .leading) {
                Text("You are my best playmate! Let's play again sometime!")
                Text("")
                Text("But I always feel tired after smart games. Let's rest! It's simple, but important to learn how to do it properly.")
            }
            .foregroundColor(.black)
            .font(.system(size: 20, weight: .regular, design: .rounded))
            
            Spacer()
            
            Image("ScaredMilo")
                .resizable()
                .scaledToFit()
            
            Spacer()
            
            NavigationLink(destination: AboutBreathingView()) {
                Text("Continue")
                    .modifier(ButtonModifier())
            }
        }
        .navigationBarBackButtonHidden(true)
        .padding()
    }
}


struct AfterView_Previews: PreviewProvider {
    static var previews: some View {
        AfterView()
    }
}
