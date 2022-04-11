//
//  MachineModels.swift
//  AutomataApp
//
//  Created by Andrew Kuhl on 4/11/22.
//

import Foundation

//DTM
//    vector<string> Q; //set of states
//    vector<string> E; //set of input characters
//    vector<string> G; //set of stack characters
//    vector<DTMTransition> d; //set of transitions
//    string q0; //start state
//    string qaccept; //accepting state
//    string qreject; //rejecting state

//PDA
//    vector<string> Q; //set of states
//    vector<string> E; //set of input characters
//    vector<string> G; //set of stack characters
//    vector<PDATransition> d; //set of transitions
//    string q0; //start state
//    vector<string> F; //set of final states

//NFA
//    vector<string> Q; //set of states
//    vector<string> E; //set of input characters
//    vector<NFATransition> d; //set of transitions
//    string q0; //start state
//    vector<string> F; //set of final states

//DFA
//    vector<string> Q; //set of states
//    vector<string> E; //set of input characters
//    vector<DFATransition> d; //set of transitions
//    string q0; //start state
//    vector<string> F; //set of final states

struct Recents: Codable{
    let input: [String]
}

struct Transition: Codable{
    let Qs, Qf, e , act1, act2, act3: String?
}

struct Machine: Identifiable, Codable{
    
    let rank: Int
    let id: String
    let type: String
    
    let Q, E: [String]
    let G: [String]?
    let d: [Transition]
    let q0: String
    let qaccept: [String]
    let qreject: String?
    var recents = [Recents]()
    
    func setMachine(_rank: Int, _id: String,_type: String, _Q: [String], _E: [String], _G: [String], _d: [Transition], _q0: String, _qaccept: [String], _qreject: String) -> Machine {
        return Machine(rank: _rank, id: _id,type: _type, Q: _Q, E: _E, G: _G, d: _d, q0: _q0, qaccept: _qaccept, qreject: _qreject, recents: recents)
    }
    mutating func addRecent(_lastInput: Recents) {
        recents.append(_lastInput)
    }
    var recentsValue: [Recents] {
        return recents
    }
}
