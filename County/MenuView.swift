//
//  MainScreen.swift
//  County
//
//  Created by Aleksandra Nikiforova on 12/04/23.
//

import SwiftUI

import SwiftUI

struct MenuView: View {
    var body: some View {
        VStack {
            Text("MeloMind")
                .foregroundColor(.black)
                .font(.system(size: 28, weight: .semibold, design: .rounded))
                .padding()
            
            VStack(alignment: .leading) {
                Text("I really love playing games. But more than playing games, I love to rest after playing.")
                Text("")
                Text("It turns out that resting isn't so simple, and it's something that we need to learn how to do.")
                Text("")
                Text("Let's play together, and afterwards, I'll teach you how to rest properly! Sounds cool?")
            }
            .foregroundColor(.black)
            .font(.system(size: 20, weight: .regular, design: .rounded))
            
            Image("HappyMilo")
                .resizable()
                .scaledToFit()
            
            Text("Choose the game")
                .foregroundColor(.black)
                .font(.system(size: 28, weight: .semibold, design: .rounded))
            
            NavigationLink(destination: MTStartView()) {
                Text("Multiplication Table")
            }
            .modifier(ButtonModifier())
            
            NavigationLink(destination: RSPStartView()) {
                Text("Rock, Scissors, Paper")
            }
            .modifier(ButtonModifier())
        }
        .padding()
        .navigationBarBackButtonHidden()
    }
}


struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
