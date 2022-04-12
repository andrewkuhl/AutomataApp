//
//  HomeViewModel.swift
//  AutomataApp
//
//  Created by Andrew Kuhl on 4/11/22.
//

import Foundation
import SwiftUI

class HomeViewModel: ObservableObject {
    
    @Published var allMachines: [Machine] = []
    @Published var allInputs: [Input] = []
    
    init() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.allInputs.append(DeveloperPreview.instance.input)
            self.allInputs.append(DeveloperPreview.instance.input)
            self.allInputs.append(DeveloperPreview.instance.input)
            self.allInputs.append(DeveloperPreview.instance.input)
            self.allInputs.append(DeveloperPreview.instance.input)
            self.allInputs.append(DeveloperPreview.instance.input)
            self.allInputs.append(DeveloperPreview.instance.input)
            self.allInputs.append(DeveloperPreview.instance.input)
            self.allInputs.append(DeveloperPreview.instance.input)
            self.allInputs.append(DeveloperPreview.instance.input)
            self.allInputs.append(DeveloperPreview.instance.input)
            self.allInputs.append(DeveloperPreview.instance.input)
            self.allInputs.append(DeveloperPreview.instance.input)
            self.allInputs.append(DeveloperPreview.instance.input)
            self.allInputs.append(DeveloperPreview.instance.input)
            self.allInputs.append(DeveloperPreview.instance.input)
            self.allInputs.append(DeveloperPreview.instance.input)
            self.allInputs.append(DeveloperPreview.instance.input)
            self.allInputs.append(DeveloperPreview.instance.input)
            self.allInputs.append(DeveloperPreview.instance.input)
            self.allInputs.append(DeveloperPreview.instance.input)
            self.allInputs.append(DeveloperPreview.instance.input)
            self.allInputs.append(DeveloperPreview.instance.input)
            self.allInputs.append(DeveloperPreview.instance.input)
            self.allInputs.append(DeveloperPreview.instance.input)
            self.allInputs.append(DeveloperPreview.instance.input)
            self.allInputs.append(DeveloperPreview.instance.input)
            self.allInputs.append(DeveloperPreview.instance.input)
            self.allInputs.append(DeveloperPreview.instance.input)
            self.allInputs.append(DeveloperPreview.instance.input)
            self.allInputs.append(DeveloperPreview.instance.input)
            self.allInputs.append(DeveloperPreview.instance.input)
            self.allMachines.append(DeveloperPreview.instance.machine)
            self.allMachines.append(DeveloperPreview.instance.machine)
            self.allMachines.append(DeveloperPreview.instance.machine)
            self.allMachines.append(DeveloperPreview.instance.machine)
            self.allMachines.append(DeveloperPreview.instance.machine)
            self.allMachines.append(DeveloperPreview.instance.machine)
            self.allMachines.append(DeveloperPreview.instance.machine)
            self.allMachines.append(DeveloperPreview.instance.machine)
            self.allMachines.append(DeveloperPreview.instance.machine)
            self.allMachines.append(DeveloperPreview.instance.machine)
            self.allMachines.append(DeveloperPreview.instance.machine)
            self.allMachines.append(DeveloperPreview.instance.machine)
            self.allMachines.append(DeveloperPreview.instance.machine)
            self.allMachines.append(DeveloperPreview.instance.machine)
            self.allMachines.append(DeveloperPreview.instance.machine)
            self.allMachines.append(DeveloperPreview.instance.machine)
            self.allMachines.append(DeveloperPreview.instance.machine)
            self.allMachines.append(DeveloperPreview.instance.machine)
            self.allMachines.append(DeveloperPreview.instance.machine)
            self.allMachines.append(DeveloperPreview.instance.machine)
            self.allMachines.append(DeveloperPreview.instance.machine)
            self.allMachines.append(DeveloperPreview.instance.machine)
            self.allMachines.append(DeveloperPreview.instance.machine)
            self.allMachines.append(DeveloperPreview.instance.machine)
            self.allMachines.append(DeveloperPreview.instance.machine)
            self.allMachines.append(DeveloperPreview.instance.machine)
            self.allMachines.append(DeveloperPreview.instance.machine)
            self.allMachines.append(DeveloperPreview.instance.machine)
            self.allMachines.append(DeveloperPreview.instance.machine)
            self.allMachines.append(DeveloperPreview.instance.machine)
            self.allMachines.append(DeveloperPreview.instance.machine)
            self.allMachines.append(DeveloperPreview.instance.machine)
            
        }
    }
}
