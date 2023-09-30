//
//  ContentView.swift
//  probability0914
//
//  Created by Miyuki Kikuchi on 14/09/2023.
//

import SwiftUI
struct ContentView: View {
    
    //property wrapper
    @State var card = "1"
    @State var computerCard = "3"
    
    @State var playerScore = 0
    @State var computerScore = 0
    @State var message = "Let's have fun!"
    
    var body: some View {
        ZStack {
            Image("back4")
                .resizable()
                .ignoresSafeArea()
            VStack {
                Spacer()
                Image("cards2")
                    .resizable()
                Spacer()
                HStack {
                    Spacer()
                    Image(card)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                    Spacer()
                    Image(computerCard)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                    Spacer()
                }
                Spacer()
                Button {
                    start()
                } label: {
                    Image("startRed")
                        .resizable()
                }
                Spacer()
                Text(message)
                    .font(.title)
                Spacer()
                HStack {
                    Spacer()
                    VStack {
                        Text("Player")
                        //type is integer, so you need to change the data type ->type casting
                        Text(String(playerScore))
                            .font(.largeTitle)
                            .padding()
                            .background(.white)
                            .cornerRadius(10)
                    }
                    Spacer()
                    VStack {
                        Text("computer")
                        Text(String(computerScore))
                            .font(.largeTitle)
                            .padding()
                            .background(.white)
                            .cornerRadius(10)
                    }
                    Spacer()
                }
                .foregroundColor(.black)
                .font(.headline)
               // Spacer()
            }
           
            }
        }
    func start(){
        //randomize the players card
        let playerCard = Int.random(in: 1...13)
        card = String(playerCard)
        //randomize the computer card
        let computerCardInt = Int.random(in: 1...13)
        computerCard = String(computerCardInt)
        //update the score
    
        
        if playerCard > computerCardInt {
            playerScore += 1
            message = "You won!"
            
        } else if computerCardInt > playerCard {
            computerScore += 1
            message = "Computer won!"
        } else {
            message = "It's a tie."
        }
        
        if playerScore == 20{
            message = "You got 20!!"
        } else if computerScore == 20{
            message = "Oh, computer is winning!"
        }
        
        }
    }

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

