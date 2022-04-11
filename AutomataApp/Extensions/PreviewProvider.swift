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
    
    let machine = Machine(rank: 1, id: "DFA1", type: "DFA", Q: ["q1","q2"], E: ["1","0"], G: [], d: [Transition(Qs: "q1", Qf: "q2", e: "1", act1: "", act2: "", act3: ""), Transition(Qs: "q2", Qf: "q1", e: "0", act1: "", act2: "", act3: "")], q0: "q1", qaccept: ["q1"], qreject: "")
}
