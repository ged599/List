//
//  ContentView.swift
//  List
//
//  Created by Glenn Dufour on 1/27/24.
//

import SwiftUI


struct ContentView: View {
    @EnvironmentObject var cellData: CellData
    
    let rowGuides = [
        GridItem(.fixed(75)),
        GridItem(.fixed(100)),
        GridItem(.fixed(100)),
        GridItem(.fixed(100))
    ]
    
    var body: some View {
        Spacer()
        LazyVGrid(columns: rowGuides) {
            ForEach(cellData.cellList) { cell in
                Text(String(cell.id))
            }
        }
        .padding()
        Spacer()
        Spacer()
    }
}

#Preview {
    ContentView().environmentObject(CellData())
}
