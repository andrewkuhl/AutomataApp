//
//  PreviewProvider.swift
//  AutomataApp
//
//  Created by Andrew Kuhl on 4/11/22.
//

import Foundation
import SwiftUI

extension PreviewProvider {
    
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
}
class DeveloperPreview {
    
    static let instance = DeveloperPreview()
    private init() { }
    
    let homeVM = HomeViewModel()
    let machine = Machine(id: 1, name: "DFA1", type: "DFA", Q: ["q1","q2"], E: ["1","0"], G: [], d: [Transition(id: 1, Qs: "q1", Qf: "q2", e: "1", act1: "", act2: "", act3: ""), Transition(id: 1, Qs: "q2", Qf: "q1", e: "0", act1: "", act2: "", act3: "")], q0: "q1", qaccept: ["q1"], qreject: "")
    let input = Input(id: 1, list: ["1","1","1","0","0","0"], M: "DFA1", acc: true)
}
