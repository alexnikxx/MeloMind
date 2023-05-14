//
//  FinishView.swift
//  County
//
//  Created by Aleksandra Nikiforova on 19/04/23.
//

import SwiftUI

struct FinishView: View {
    var body: some View {
        VStack(alignment: .center) {
            Text("Do you feel better?")
                .foregroundColor(.black)
                .font(.system(size: 28, weight: .semibold, design: .rounded))
                .padding()
            
            VStack(alignment: .leading) {
                Text("I hope you are. Next time you feel sad, come to me and we'll play and breathe together.")
                Text("")
                Text("But if I'm not around, just take a deep breath in and out. This should definitely help!")
            }
            .foregroundColor(.black)
            .font(.system(size: 20, weight: .regular, design: .rounded))
            
            Spacer()
            
            Image("BaloonMilo")
                .resizable()
                .scaledToFit()
            
            Spacer()
            
            NavigationLink(destination: MenuView()) {
                Text("Menu")
                    .modifier(ButtonModifier())
            }
        }
        .navigationBarBackButtonHidden(true)
        .padding()
    }
}

struct FinishView_Previews: PreviewProvider {
    static var previews: some View {
        FinishView()
    }
}
