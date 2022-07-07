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
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .yellow]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
             //   Spacer()
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
                        //action
                    }) {
                        Image(countries[number])
                            .frame(width: 250, height: 130)
                            .clipShape(Capsule())
                            .overlay(Capsule()
                                .stroke(Color.black, lineWidth: 1))
                    }
                   // Spacer()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
