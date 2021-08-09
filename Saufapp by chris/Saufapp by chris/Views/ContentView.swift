//
//  ContentView.swift
//  Saufapp by chris
//
//  Created by Christoph Dries on 18.07.21.
//

import SwiftUI

struct ContentView: View {
    
    @State var teamGenerator: Bool = false
    
    var body: some View {
        
        if(!teamGenerator){
            HomeScreen(teamGenerator: $teamGenerator)
        }else{
            TeamGenerator(teamGenerator: $teamGenerator)
        }
    }
}

struct HomeScreen : View {
    
    @Binding var teamGenerator: Bool
    var body: some View {
        VStack {
            Spacer()
            Text("Saufapp").padding()
                .font(.largeTitle)
            Spacer()
                .padding(.bottom, 20.0)
            
            Button(action: {
                self.teamGenerator = true
            }, label: {
                HStack{
                    Image(systemName: "pencil")
                    Text("Teams erstellen")
                }
            }).padding()
                
            Spacer()
            Image("beerlogo")
        }
    }
}

struct TeamGenerator : View {
    
    @State var players: Int = 0
    @State var pString: String = ""
    
    @State var teams: Int = 0
    @State var tString: String = ""
    @Binding var teamGenerator: Bool
    var body: some View {
        VStack{
            Button(action: {
                self.teamGenerator = false
            }, label: {
                HStack{
                    Image(systemName: "arrowshape.turn.up.backward")
                    Text("Zurück zum Hauptmenü")
                }
            }).padding()
            
            TextField("Anzahl Spieler angeben", text: $pString).padding(.leading, 20.0)
            //Spacer()
            TextField("Anzahl Teams eingeben", text: $tString).padding(.leading, 20.0)
            
            Spacer()
            Text(pString + "    " + tString + String(players))
        }
    }
}

func number(from: String) -> Int{
    return Int(from) ?? 0
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
