//
//  WorldOfWarcraftView.swift
//  BattleNetAPI-Example
//
//  Created by Christopher Jennewein on 2/9/21.
//

import BattleNetAPI
import SwiftUI


struct WorldOfWarcraftView: View {
    let apiType: APIType
    
    
    var body: some View {
        Text("WorldOfWarcraftView")
    }
}



struct WorldOfWarcraftView_Previews: PreviewProvider {
    static var previews: some View {
        WorldOfWarcraftView(apiType: .gameData)
    }
}
