//
//  Beginning.swift
//  County
//
//  Created by Aleksandra Nikiforova on 14/04/23.
//

import SwiftUI

struct Beginning: View {
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Spacer()
                    
                    Text("Hello, friend!")
                        .font(.system(size: 28, weight: .semibold, design: .rounded))
                    Text("My name is Melo!")
                        .font(.system(size: 20, weight: .regular, design: .rounded))
                    Text("Let's play a game together!")
                        .font(.system(size: 20, weight: .regular, design: .rounded))
                    
                    Spacer()
                    
                    Image("WaveMilo")
                        .resizable()
                        .scaledToFit()
                    
                    Spacer()
                    
                    NavigationLink(destination: MenuView()){
                        Text("Let's play!")
                            .modifier(ButtonModifier())
                    }
                    VStack {
                        Text("Yaldaal Illustration Pack 🍉 by Daal Agency - Figma")
                            .underline()
                            .frame(alignment: .center)
                            .font(.system(size: 14, weight: .regular, design: .rounded))
                            .foregroundColor(.gray)
                            .onTapGesture {
                                guard let url = URL(string: "https://www.figma.com/community/file/1053720653849619970/Yaldaal-Illustration-Pack-%F0%9F%8D%89") else { return }
                                UIApplication.shared.open(url)
                            }
                        
                        Text("Hello icons created by Vitaly Gorbachev - Flaticon")
                            .underline()
                            .frame(alignment: .center)
                            .font(.system(size: 14, weight: .regular, design: .rounded))
                            .foregroundColor(.gray)
                            .onTapGesture {
                                guard let url = URL(string: "https://www.flaticon.com/free-icons/hello") else { return }
                                UIApplication.shared.open(url)
                            }
                    }
                }
                .foregroundColor(.black)
            }
            .padding()
        }
        .navigationViewStyle(.stack)
    }
}

struct Beginning_Previews: PreviewProvider {
    static var previews: some View {
        Beginning()
    }
}
