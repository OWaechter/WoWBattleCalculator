//
//  ContentView.swift
//  WoWBattleCalculator
//
//  Created by Oliver Wächter on 31.08.22.
//

import SwiftUI

struct ContentView: View {
    
    var enemies  = [
        Enemy(id: 1, name: "Blue Spider", fightingValue: 5, damage: 4, health:9, specialTrait: spiderTrait),
        Enemy(id: 2, name: "Red Spider", fightingValue: 4, damage: 5, health: 10, specialTrait: spiderTrait),
        Enemy(id: 3, name: "Green Spider", fightingValue: 4, damage: 4, health: 8, specialTrait: spiderTrait),
        Enemy(id: 4, name: "Blue Murloc", fightingValue: 6, damage: 4, health: 2, specialTrait: murlocTrait),
        Enemy(id: 5, name: "Red Murloc", fightingValue: 5, damage: 5, health: 4, specialTrait: murlocTrait),
        Enemy(id: 6, name: "Green Murloc", fightingValue: 5, damage: 3, health: 2, specialTrait: murlocTrait),
        Enemy(id: 7, name: "Blue Gouhl", fightingValue: 6, damage: 4, health: 3, specialTrait: gouhlTrait),
        Enemy(id: 8, name: "Red Gouhl", fightingValue: 6, damage: 5, health: 4, specialTrait: gouhlTrait),
        Enemy(id: 9, name: "Green Gouhl", fightingValue: 6, damage: 3, health: 2, specialTrait: gouhlTrait),
        Enemy(id: 10, name: "Blue Naga", fightingValue: 5, damage: 5, health: 7, specialTrait: nagaTrait),
        Enemy(id: 11, name: "Red Naga", fightingValue: 4, damage: 6, health: 8, specialTrait: nagaTrait),
        Enemy(id: 12, name: "Green Naga", fightingValue: 4, damage: 5, health: 6, specialTrait: nagaTrait),
        Enemy(id: 13, name: "Blue Shade", fightingValue: 7, damage: 6, health: 8, specialTrait: shadeTrait),
        Enemy(id: 14, name: "Red Shade", fightingValue: 6, damage: 7, health: 9, specialTrait: shadeTrait),
        Enemy(id: 15, name: "Green Shade", fightingValue: 6, damage: 5, health: 8, specialTrait: shadeTrait),
        Enemy(id: 16, name: "Blue Moonkin", fightingValue: 6, damage: 8, health: 11, specialTrait: moonkinTrait),
        Enemy(id: 17, name: "Red Moonkin", fightingValue: 5, damage: 9, health: 12, specialTrait: moonkinTrait),
        Enemy(id: 18, name: "Green Moonkin", fightingValue: 5, damage: 8, health: 10, specialTrait: moonkinTrait),
        Enemy(id: 19, name: "Blue Dragon", fightingValue: 7, damage: 10, health: 14, specialTrait: dragonTrait),
        Enemy(id: 20, name: "Red Dragon", fightingValue: 6, damage: 11, health: 15, specialTrait: dragonTrait),
        Enemy(id: 21, name: "Green Dragon", fightingValue: 6, damage: 9, health: 13, specialTrait: dragonTrait),
        Enemy(id: 22, name: "Blue Hellfire", fightingValue: 7, damage: 12, health: 14, specialTrait: hellfireTrait),
        Enemy(id: 23, name: "Red Hellfire", fightingValue: 7, damage: 12, health: 16, specialTrait: hellfireTrait),
        Enemy(id: 24, name: "Green Hellfire", fightingValue: 7, damage: 11, health: 13, specialTrait: hellfireTrait),
        Enemy(id: 25, name: "Blue Gnoll", fightingValue: 5, damage: 4, health: 4, specialTrait: gnollTrait),
        Enemy(id: 26, name: "Red Gnoll", fightingValue: 4, damage: 5, health: 5, specialTrait: gnollTrait),
        Enemy(id: 27, name: "Green Gnoll", fightingValue: 4, damage: 3, health: 3, specialTrait: gnollTrait),
        Enemy(id: 28, name: "Blue Crusader", fightingValue: 6, damage: 4, health: 4, specialTrait: scarletknightTrait),
        Enemy(id: 29, name: "Red Crusader", fightingValue: 5, damage: 5, health: 5, specialTrait: scarletknightTrait),
        Enemy(id: 30, name: "Green Crusader", fightingValue: 5, damage: 4, health: 3, specialTrait: scarletknightTrait),
        Enemy(id: 31, name: "Blue Spider", fightingValue: 5, damage: 4, health: 9, specialTrait: spiderTrait),
        Enemy(id: 32, name: "Red Spider", fightingValue: 4, damage: 5, health: 10, specialTrait: spiderTrait),
        Enemy(id: 33, name: "Green Spider", fightingValue: 4, damage: 4, health: 8, specialTrait: spiderTrait),
        Enemy(id: 34, name: "Blue Worg", fightingValue: 6, damage: 7, health: 8, specialTrait: worgTrait),
        Enemy(id: 35, name: "Red Worg", fightingValue: 5, damage: 9, health: 9, specialTrait: worgTrait),
        Enemy(id: 36, name: "Green Worg", fightingValue: 5, damage: 7, health: 8, specialTrait: worgTrait),
        Enemy(id: 37, name: "Blue Ogre", fightingValue: 5, damage: 10, health: 10, specialTrait: ogerTrait),
        Enemy(id: 38, name: "Red Ogre", fightingValue: 4, damage: 11, health: 11, specialTrait: ogerTrait),
        Enemy(id: 39, name: "Green Ogre", fightingValue: 4, damage: 9, health: 10, specialTrait: ogerTrait),
        Enemy(id: 40, name: "Blue Doomguard", fightingValue: 7, damage: 11, health: 13, specialTrait: doomguardTrait),
        Enemy(id: 41, name: "Red Doomguard", fightingValue: 7, damage: 12, health: 14, specialTrait: doomguardTrait),
        Enemy(id: 42, name: "Green Doomguard", fightingValue: 7, damage: 10, health: 12, specialTrait: doomguardTrait)
    ]
    
    @State private var blueHits = 0
    @State private var redHits = 0
    @State private var greenHits = 0
    @State private var finalDamage = 0
    @State private var bloodDamage = 0
    @State private var selectedEnemy = Enemy(id: 1, name: "Blue Spider", fightingValue: 5, damage: 4, health: 9, specialTrait: spiderTrait)
    
    var calcPlayerDamage:Int{
        do{
            var defense = 0
            var damageToPlayer = 0
            
            defense = redHits + greenHits
            damageToPlayer = selectedEnemy.damage - defense
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
            possibleDamage = defense - selectedEnemy.damage
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
                    Spacer()
                    VStack(){
                        
                        Picker("Enemy", selection: $selectedEnemy){
                            ForEach(enemies, id: \.id) {
                                Text($0.name).tag($0.self)
                                
                            }
                        }
                        
                        Section{
                            Text("Battle Value")
                            Text("\(selectedEnemy.fightingValue)")
                            
                        }
                        
                        Section{
                            Text("Damage")
                            Text("\(selectedEnemy.damage)")
                        }
                        
                        Section{
                            Text("Health")
                            Text("\(selectedEnemy.health)")
                        }
                    }
                    
                    Spacer()
                    
                    VStack{
                        Section{
                            Stepper("Blue Hits: \(blueHits)", value: $blueHits, in:0...7)
                        }
                        Section{
                            Stepper("Red Hits: \(redHits)", value: $redHits, in:0...7)
                            
                        }
                        Section{
                            Stepper("Green Hits: \(greenHits)", value: $greenHits, in:0...7)
                        }
                        VStack{
                            Stepper("Blood Damage: \(bloodDamage)", value: $bloodDamage, in:0...15)
                        }
                        
                    }
                    Spacer()
                    
                    
                    VStack{
                        Text("Result")
                        Text("Damage to Player: \(calcPlayerDamage)")
                        Text("Damage to Monster: \(calcDamageToMonster)")
                        Spacer();
                        Text("Special Trait: ")
                        Spacer();
                        Text("\(selectedEnemy.specialTrait)")
                        Spacer();
                    }
                        .navigationTitle("WoW Battle Calculator")
                    
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
