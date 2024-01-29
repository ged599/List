//
//  Cell.swift
//  swiftbs
//
//  Created by Glenn Dufour on 1/16/24.
//

import Foundation
import SwiftUI

class CellData: ObservableObject {
    var cells: [Cell] = []
    @Published var cellList: [Cell] = []
    
    init() {
        for i in 0...15 {
            print("initializing cell => \(i)")
            let newCell = Cell(id:i, occupied: Bool.random(), shot: Bool.random())
            cells.append(newCell)
            cellList.append(newCell)
        }
    }
    
    
}

class Cell: Identifiable {
    
//    var state: (UUID, Bool, Bool) {
//        (self.id, self.isOccupied, self.isShot)
//    }
    
    var dump: String {
        "\(self.id):\(self.display)"
    }
    
    var dumpAll: String {
        "id:\(self.id), createdAt: \(self.createdAt), occupied: \(self.isOccupied), shot: \(self.isShot), display: \(self.display)"
    }
    
    let id: Int
    
    let createdAt = Int(Date.now.timeIntervalSince1970 * 1000 - 1_705_000_000)
    let showAll: Bool = true
    
    var isOccupied = false
    var isShot = false
    
    init(id: Int, occupied: Bool = true, shot: Bool = false) {
        self.id = id
        self.isOccupied = occupied
        self.isShot = shot
    }
    
    var hit: Bool {
        return self.isOccupied && self.isShot
    }
    
    func occupy() {
        self.isOccupied = true
    }

    // records a shot. returns true if the cell is occupied
    func shoot() -> Bool{
        if self.isShot {print("wasted shot") } else {
            self.isShot = true
        }
        return self.isOccupied
    }
    
    var display : String {
        let state = (self.isOccupied, self.isShot)
        switch state {
        case (true, true ) :
            return "!"
        case (false, true):
            return "X"
        case (false, false):
            return "0"
        default:
            return showAll ? "B" : "0"
        }
    }
   
    
}
