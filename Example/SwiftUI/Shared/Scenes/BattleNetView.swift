//
//  BattleNetView.swift
//  BattleNetAPI-Example
//
//  Created by Christopher Jennewein on 2/9/21.
//

import BattleNetAPI
import SwiftUI


struct BattleNetView: View {
    let apiType: APIType
    
    
    var body: some View {
        Text("BattleNetView")
    }
}



struct BattleNetView_Previews: PreviewProvider {
    static var previews: some View {
        BattleNetView(apiType: .profile)
    }
}
