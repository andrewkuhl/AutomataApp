//
//  ModalViewModel.swift
//  AutomataApp
//
//  Created by Andrew Kuhl on 4/13/22.
//

import Foundation
import SwiftUI

class ModalViewModel: ObservableObject {
    
    @Published var machine = Machine(id: 0, name: "", type: "", Q: 0, States: [], E: [], G: [], d: [], q0: st(name: ""), qaccept: [], qreject: "", recents: [], selectedItems: [])
    @Published var codes = [Transition]()
    @Published var inputs = [String]()
    @Published var States = [st]()
    @Published var selectedMach = "none"
    @Published var QValue: Int = 0
    @Published var EValue = ""
    @Published var GValue = [String]()
    @Published var dValue = [Transition]()
    @Published var q0Value = st(name: "")
    @Published var qaccept = [String]()
    @Published var qreject = ""
    @Published var selected = Set<st.ID>()
    
    
    init() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            
        }
    }
    
}

