//
//  ContentView.swift
//  GuessFlag
//
//  Created by Надежда on 2022-07-07.
//

import SwiftUI

struct ContentView: View {
    
    @State private var countries = ["UK", "USA", "Bangladesh", "Germany", "Argentina", "Brazil", "Canada", "Greece", "Sweden"] .shuffled() //перемешаем
    @State private var indexOfRandomCountries = Int.random(in: 0...2) //чтобы на экране было 3 варианта флага
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .yellow]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Choose the flag:")
                    .foregroundColor(.white)
                    .font(.headline)
                Text(countries[indexOfRandomCountries])
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
