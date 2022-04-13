//
//  ModalViewModel.swift
//  AutomataApp
//
//  Created by Andrew Kuhl on 4/13/22.
//

import Foundation
import SwiftUI

class ModalViewModel: ObservableObject {
    
    @Published var codes = [Transition]()
    @Published var inputs = [String]()
    @Published var States: [String] = []
    @Published var selectedMach = "none"
    @Published var QValue: Int = 0
    @Published var EValue = ""
    @Published var GValue: [String] = []
    @Published var dValue: [Transition] = []
    @Published var q0Value = ""
    @Published var qaccept: [String] = []
    @Published var qreject = ""
    
    init() {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            
        }
    }
}

