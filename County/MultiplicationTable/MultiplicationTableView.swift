//
//  MultiplicationTableView.swift
//  County
//
//  Created by Aleksandra Nikiforova on 06/04/23.
//

import SwiftUI

struct MultiplicationTableView: View {
    @State var number1 = 0
    @State var number2 = 0
    @State var answers: [Int] = [0, 1, 2]
    @State var correctAnswer = 0
    
    @State var score = 0
    @State var move = 0
    @State var resultImage = Image("DrinkingMilo")
    
    @State private var gameEnd = false
    @State private var showingMeditationButton = false
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack {
                Text("Answer this question:")
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                Text("\(number1) x \(number2) = ?")
                    .font(.system(size: 28, weight: .semibold, design: .rounded))
                
                HStack {
                    ForEach(0..<3) { index in
                        Button {
                            isAnswerRight(answer: answers[index])
                            generateAnswers()
                            move += 1
                        } label: {
                            Text("\(answers[index])")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(.red.opacity(0.1))
                                .font(.system(size: 28, weight: .semibold, design: .rounded))
                                .cornerRadius(20)
                        }
                    }
                    .padding(.horizontal, 8)
                }
                .frame(maxWidth: .infinity)
                .font(.system(size: 28, weight: .semibold, design: .rounded))
                
                Text("Score: \(score)")
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                
            }
            .font(.title3.bold())
            .foregroundColor(.black)
            .padding(.vertical, 15)
            .frame(maxWidth: .infinity)
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(lineWidth: 2)
                    .foregroundColor(Color.black)
            )
            
            Spacer()
            
            resultImage
                .resizable()
                .scaledToFit()
            
            Spacer()
            VStack {
                Text("Press when you are ready!")
                NavigationLink(destination: AfterView()) {
                    Text("Continue")
                        .modifier(ButtonModifier())
                }
            }
            .font(.system(size: 20, weight: .regular, design: .rounded))
            .opacity(showingMeditationButton ? 1 : 0)
        }
        .padding()
        .navigationBarBackButtonHidden(true)
        .onAppear(perform: generateAnswers)
        .alert("End of the game!", isPresented: $gameEnd) {
            Button("OK", action: restart)
        } message: {
            Text(score >= 5 ? "You beat me! Your final score is \(score) points! Now we can continue the game or go on our next journey!" : "I won! Your final score is \(score) points! Now we can continue the game or go on our next journey!")
        }
    }
    
    func isAnswerRight(answer: Int) {
        if answer == correctAnswer {
            score += 1
            resultImage = Image("HappyMilo")
        } else {
            score -= 1
            resultImage = Image("SadMilo")
        }
    }
    
    func generateAnswers() {
        if move == 9 {
            gameEnd = true
            showingMeditationButton = true
        }
        
        number1 = Int.random(in: 1...10)
        number2 = Int.random(in: 1...10)
        
        var answerArray = [Int]()
        correctAnswer = number1 * number2
        
        answerArray.append(number1 * number2 + Int.random(in: 1...3))
        answerArray.append(number1 * number2 - Int.random(in: 1...3))
        answerArray.append(correctAnswer)
        
        answers = answerArray.shuffled()
    }
    
    func restart() {
        generateAnswers()
        score = 0
        move = 0
    }
}


struct MultiplicationTableView_Previews: PreviewProvider {
    static var previews: some View {
        MultiplicationTableView()
    }
}
