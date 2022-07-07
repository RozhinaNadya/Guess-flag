//
//  ContentView.swift
//  GuessFlag
//
//  Created by Надежда on 2022-07-07.
//

import SwiftUI

struct ContentView: View {
    
    @State private var countries = ["UK", "USA", "Bangladesh", "Germany", "Argentina", "Brazil", "Canada", "Greece", "Sweden"] .shuffled() //перемешаем
    @State private var indexOfRandomCountries = Int.random(in: 0...2) //тк на экране будет 3 варианта флага
    @State private var gameScore = 0
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .yellow]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                
                VStack {
                    Text("Choose the flag:")
                        .foregroundColor(.white)
                        .font(.headline)
                    Text(countries[indexOfRandomCountries])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
                
                ForEach(0..<3) { number in
                    Button(action: {
                        flagTapped(number)
                        showingScore = true
                    }) {
                        Image(countries[number])
                            .frame(width: 250, height: 125)
                            .clipShape(Capsule())
                            .overlay(Capsule()
                                .stroke(Color.black, lineWidth: 1))
                            .shadow(color: .black, radius: 2)
                    }
                }
                
                Text("The game score: \(gameScore)")
                    .font(.headline)
            }
        } .alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text("Total score: \(gameScore)"), dismissButton: .default(Text("Back to the game")) {
                askQuestion()
            })
        }
    }
    
    func askQuestion() {
        countries.shuffle()
        indexOfRandomCountries = Int.random(in: 0...2)
    }
    
    func flagTapped(_ number: Int) {
        if number == indexOfRandomCountries {
            scoreTitle = "That's right!"
            gameScore += 1
        } else {
            scoreTitle = "Wrong! This is \(countries[number])"
            gameScore -= 1
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
