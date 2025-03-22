//
//  ContentView.swift
//  War Card Game
//
//  Created by Disha Kurkuri on 16/12/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var playerCard = "card12"
    @State var CPUCard = "card2"
    
    @State var playerScore = 0
    @State var CPUScore = 0
    
    @State var result: String = ""
    
    var body: some View {
        
        ZStack {
            Image("background-plain")
                .resizable()
                .ignoresSafeArea()
            VStack {
                Spacer()
                Image("logo")
                Spacer()
                HStack {
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(CPUCard)
                    Spacer()
                }
                Spacer()
                
                Button {
                    deal()
                } label: {
                    Image("button")
                }
                Spacer()
                
                Text(result)
                    .font(.title2)
                    .foregroundColor(.white)
                
                Spacer()
                HStack {
                    Spacer()
                    VStack {
                        Text("Player")
                            .font(.headline)
                            .padding(.bottom, 5.0)
                        Text(String(playerScore))
                            .font(.largeTitle)
                    }
                    Spacer()
                    VStack {
                        Text("CPU")
                            .font(.headline)
                            .padding(.bottom, 5.0)
                        Text(String(CPUScore))
                            .font(.largeTitle)
                    }
                    Spacer()
                }
                .foregroundColor(.white)
                Spacer()
            }
            .padding()
        }
    }
    
    func deal() {
        //randomise player card
        let playerRandom = Int.random(in: 2...14)
        playerCard = "card" + String(playerRandom)
        
        //randomise CPU card
        let CPURandom = Int.random(in: 2...14)
        CPUCard = "card" + String(CPURandom)
        
        //Update the score
        if (playerRandom > CPURandom) {
            playerScore += 1
            result = "You Win."
        } else if (CPURandom > playerRandom) {
            CPUScore += 1
            result = "You lose."
        } else {
            result = "Draw."
        }
    }
}

#Preview {
    ContentView()
}
