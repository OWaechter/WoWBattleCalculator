//
//  ContentView.swift
//  WoWBattleCalculator
//
//  Created by Oliver Wächter on 31.08.22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var blueHits = 0
    @State private var redHits = 0
    @State private var greenHits = 0
    @State private var finalDamage = 0
    @State private var bloodDamage = 0
    @State private var showingSelectFirstEnemy = false
    @State private var showingSelectSecondEnemy = false
    @State private var showingSelectThirdEnemy = false
    @StateObject var selectEnemy = SelectEnemy()
    
    var calcPlayerDamage:Int{
        do{
            var defense = 0
            var damageToPlayer = 0
            
            defense = redHits + greenHits
            damageToPlayer = selectEnemy.firstEnemy.damage + selectEnemy.secondEnemy.damage - defense
            if damageToPlayer < 0 {
                damageToPlayer = 0
            }
            
            return damageToPlayer
            
        }
    }
    var calcDamageToMonster:Int{
        do{
            var defense = 0
            var saveDamage = 0
            var possibleDamage = 0
            var damageToMonster = 0
            
            defense = redHits + greenHits
            possibleDamage = defense - selectEnemy.firstEnemy.damage - selectEnemy.secondEnemy.damage
            saveDamage = blueHits + bloodDamage
            
            damageToMonster = saveDamage + (possibleDamage < 0 ? 0 : possibleDamage)
            
            if damageToMonster < 0 {
                damageToMonster = 0
            }
            return damageToMonster
        }
        
    }
    
    var body: some View {
        NavigationView{
            ZStack(alignment: .center){
                VStack(alignment: .center){
                    
                    HStack{
                        Spacer()
                        Button(action: {
                            showingSelectFirstEnemy = true
                        })
                        {
                            Image("UserIcon")
                        }
                        .sheet(isPresented:$showingSelectFirstEnemy){
                            SelectView(selectEnemy: selectEnemy)
                        }
                        
                        
                        Button(action: {
                            showingSelectSecondEnemy = true
                            
                        })
                        {
                            Image("UserIcon")
                        }
                        .sheet(isPresented:$showingSelectSecondEnemy){
                            SelectView2(selectEnemy: selectEnemy)}
                        
                        Button(action: {
                            showingSelectThirdEnemy = true
                            
                        })
                        {
                            Image("UserIcon")
                        }
                        .sheet(isPresented:$showingSelectThirdEnemy){
                            SelectView3(selectEnemy: selectEnemy)}
                        
                    }
                    .padding()
                    
                    HStack{
                        Spacer()
                        
                        Text("Battle Value")
                        Text("\(selectEnemy.firstEnemy.fightingValue)")
                                                    
                        Spacer()
                        
                        Text("Damage")
                        Text("\(selectEnemy.firstEnemy.damage)")
                        
                        Spacer()
                        
                        Text("Health")
                        Text("\(selectEnemy.firstEnemy.health)")
                        
                        Spacer()
                    }//First Enemy Stats
                    HStack{
                        Spacer()
                        Text("Battle Value")
                        Text("\(selectEnemy.secondEnemy.fightingValue)")
                                                    
                        Spacer()
                        
                        Text("Damage")
                        Text("\(selectEnemy.secondEnemy.damage)")
                        
                        Spacer()
                        
                        Text("Health")
                        Text("\(selectEnemy.secondEnemy.health)")
                        Spacer()
                    }//Second Enemy Stats
                    
                    Spacer()
                    
                    VStack{
                        Spacer()
                        Text("Blue Hits: \(blueHits)")
                        
                        Text("Red Hits: \(redHits)")
                        
                        Text("Green Hits: \(greenHits)")
                        
                        Text("Blood Damage: \(bloodDamage)")
                        Spacer()
                        
                        
                    }// Hits
                    
                    VStack{
                        Text("Result")
                        Text("Damage to Player: \(calcPlayerDamage)")
                        Text("Damage to Monster: \(calcDamageToMonster)")
                        
                    }// Results
                    
                    HStack{
                        ZStack{
                            Circle()
                                .strokeBorder(.black,lineWidth: 2)
                                .background(Circle().fill(.clear))
                                .position(x:90,y:90)
                            
                            Button(action: {
                                AddHit(Color: "Red")
                            }) {
                                Text("+")
                                    .frame(width: 20 , height: 20, alignment: .center)
                            }
                            .background(Color.red)
                            .foregroundColor(Color.white)
                            .cornerRadius(5)
                            .position(x:150,y:80)
                            
                            Button(action: {
                                RemoveHit(Color: "Red")
                            }) {
                                Text("-")
                                    .frame(width: 20 , height: 20, alignment: .center)
                            }
                            .background(Color.red)
                            .foregroundColor(Color.white)
                            .cornerRadius(5)
                            .position(x:150,y:130)
                            
                            Button(action: {
                                AddHit(Color: "Green")
                            }) {
                                Text("+")
                                    .frame(width: 20 , height: 20, alignment: .center)
                            }
                            .background(Color.green)
                            .foregroundColor(Color.white)
                            .cornerRadius(5)
                            .position(x:100,y:80)
                            
                            Button(action: {
                                RemoveHit(Color: "Green")
                            }) {
                                Text("-")
                                    .frame(width: 20 , height: 20, alignment: .center)
                            }
                            .background(Color.green)
                            .foregroundColor(Color.white)
                            .cornerRadius(5)
                            .position(x:100,y:130)
                            
                            
                        } //Red and Green Circle
                        ZStack{
                            Circle()
                                .strokeBorder(.black,lineWidth: 2)
                                .background(Circle().fill(.clear))
                                .position(x:90,y:150)
                            
                            Button(action: {
                                AddHit(Color: "BloodDamage")
                            }) {
                                Text("+")
                                    .frame(width: 20 , height: 20, alignment: .center)
                            }
                            .background(Color.yellow)
                            .foregroundColor(Color.white)
                            .cornerRadius(5)
                            .position(x:150,y:130)
                            
                            Button(action: {
                                RemoveHit(Color: "BloodDamage")
                            }) {
                                Text("-")
                                    .frame(width: 20 , height: 20, alignment: .center)
                            }
                            .background(Color.yellow)
                            .foregroundColor(Color.white)
                            .cornerRadius(5)
                            .position(x:150,y:180)
                            
                            
                        } //BloodDamage Circle
                        
                    }// Circles
                    ZStack{
                        Circle()
                            .strokeBorder(.black,lineWidth: 2)
                            .background(Circle().fill(.clear))
                            .position(x:90,y:90)
                        
                        Button(action: {
                            AddHit(Color: "Blue")
                        }) {
                            Text("+")
                                .frame(width: 20 , height: 20, alignment: .center)
                        }
                        .background(Color.blue)
                        .foregroundColor(Color.white)
                        .cornerRadius(5)
                        .position(x:150,y:80)
                        
                        Button(action: {
                            RemoveHit(Color: "Blue")
                        }) {
                            Text("-")
                                .frame(width: 20 , height: 20, alignment: .center)
                        }
                        .background(Color.blue)
                        .foregroundColor(Color.white)
                        .cornerRadius(5)
                        .position(x:150,y:130)
                        
                        
                    } // Blue Circle
                }
                .navigationTitle("WoW Battle Calculator")
                
            }
        }
        .navigationViewStyle(.stack)
    }
    
    func AddHit(Color:String){
        
        switch Color{
        case "Red":
            if redHits < 7 {
                redHits += 1
            }
        case "Blue":
            if blueHits < 7 {
                blueHits += 1
            }
        case "Green":
            if greenHits < 7 {
                greenHits += 1
            }
        case "BloodDamage":
            if bloodDamage < 7 {
                bloodDamage += 1
            }
            
        default:
            print("No color found")
        }
    }
    
    func RemoveHit(Color:String){
        
        switch Color{
        case "Red":
            if redHits > 0{
                redHits -= 1
            }
        case "Blue":
            if blueHits > 0 {
                blueHits -= 1
            }
        case "Green":
            if greenHits > 0{
                greenHits -= 1
            }
        case "BloodDamage":
            if bloodDamage > 0 {
                bloodDamage -= 1
            }
        default:
            print("No color found")
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
