//
//  SelectEnemyView.swift
//  WoWBattleCalculator
//
//  Created by Oliver Wächter on 14.11.22.
//

import SwiftUI

struct SelectView: View {
    let columns = [
        GridItem(.adaptive(minimum: 150))]
    @ObservedObject var selectEnemy : SelectEnemy
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView{
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(selectEnemy.enemyList){ enemy in
                        Text("\(enemy.name)")
                            .foregroundColor(.black)
                            .font(.largeTitle)
                            .onTapGesture {
                                selectEnemy.firstEnemy = enemies[enemy.id]
                                dismiss()
                            }
                        
                    }
                }
            }
        }
    }
    
}
struct SelectView2: View {
    let columns = [
        GridItem(.adaptive(minimum: 150))]
    @ObservedObject var selectEnemy : SelectEnemy
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView{
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(selectEnemy.enemyList){ enemy in
                        Text("\(enemy.name)")
                            .foregroundColor(.black)
                            .font(.largeTitle)
                            .onTapGesture {
                                selectEnemy.secondEnemy = enemies[enemy.id]
                                dismiss()
                                    
                            }
                    }
                }
            }
        }
    }
    
}
struct SelectView3: View {
    let columns = [
        GridItem(.adaptive(minimum: 150))]
    @ObservedObject var selectEnemy : SelectEnemy
    
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationView{
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(selectEnemy.enemyList){ enemy in
                        Text("\(enemy.name)")
                            .foregroundColor(.black)
                            .font(.largeTitle)
                            .onTapGesture {
                                selectEnemy.secondEnemy = enemies[enemy.id]
                                dismiss()
                                    
                            }
                    }
                }
            }
        }
    }
    
}
    

struct SelectView_Previews: PreviewProvider {
    static var previews: some View {
        SelectView(selectEnemy: SelectEnemy())
        SelectView2(selectEnemy: SelectEnemy())
        SelectView3(selectEnemy: SelectEnemy())
    }
}
