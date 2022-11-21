//
//  EnemyController.swift
//  WoWBattleCalculator
//
//  Created by Oliver Wächter on 31.08.22.
//

import Foundation

struct Enemy:Identifiable,Hashable{
    var id : Int
    var name: String
    var fightingValue:Int
    var damage:Int
    var health:Int
    var specialTrait:String
}


let spiderTrait = "Die Charaktere können keine Treffer durch Blutschaden erzielen Zum Ende jeder Wurfwiederholung: Der aktive Charakter erhält Betäubungsmarker für jedes 1 und jedes 2 Resultat"

let gouhlTrait = "Die Charaktere können keine Wurfwiederholung machen, unabhängig davon, welche Wurfwiederholungswerte sie haben."
    
let nagaTrait = "Zum Ende jeder Wurfwiederholung: Der aktive Charakter verliert 1 Lebensmarker für jedes 1 und jedes 2 Resultat. (Blau/Rot"
    
let shadeTrait = "Die Charaktere können keine Treffer durch Blutschaden erzielen. Zum Ende jeder Wurfwiederholung: Der aktive Charakter erhält 1 Fluchmarker für jedes 4 Resultat."
    
let moonkinTrait = "Zum Ende jeder Wurfwiederholung: Der aktive Charakter muss für jedes 1 Resultat 1 Kraftkarte abrüsten."
    
let dragonTrait = "Die Charaktere dürfen keine Rüstungsmarker in ihr Verteidigungsfeld legen , außer sie wurden durch 8 Resultate gewonnen."
    
let hellfireTrait = "Zum Ende jeder Wurfwiederholung: Der aktive Charakter verliert 2 Energiemarker und 2 Lebensmarker für jedes 1 Resultat.(Rot/Blau) Zum Ende jeder Auswertung: 3 Treffermarker werden vom Schadensfeld entfernt."
    
let gnollTrait = "Zum Ende jeder Wurfwiederholung: Der aktive Charakter verliert 1 Energiemarker für jedes 1 Resultat. (Rot/Blau)"
    
let scarletknightTrait = "Zum Ende jeder Auswertung: Für jeden Scharlachroten Kreuzitter, der noch nicht besiegt ist, wird 1 Treffermarker vom Schadensfeld entfernt."
    
let worgTrait = "Zum Ende jeder Auswertung: Für jeden Worg, der noch nicht besiegt ist, werden 2 Treffermarker vom Schadensfeld entfernt."
    
let ogerTrait = "Zum Ende jeder Wurfwiederholung: Der ative Chankier verliert 2 Lebensmarker für jedes 1 und jedes 2 Resultat.(Rot)"
    
let doomguardTrait = "Zum Ende jeder Wurfwiederholung: Der aktive Charakter verliert 1 Lebensmarker für jedes 1 und jedes 2 Resultat. Alle Würfel mit diesen Resultaten werden zur Seite gelegt und können in diesem Kampf von keinem Charakter mehr benutzt werden.(Rot/Blau)"

let murlocTrait = "Zum Ende jeder Wurfwiederholung: Der aktive Charakter verliert 1 Lebensmarker für jedes 1 Resultat. (Rot/Blau)"

