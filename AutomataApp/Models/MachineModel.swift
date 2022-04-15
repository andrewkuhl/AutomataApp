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

struct Input: Identifiable, Codable{
    let id: Int
    let list: [String]
    let M: String
    let acc: Bool
}


struct Transition: Identifiable, Codable{
    let id: Int
    var Qs, Qf, e , act1, act2, act3: String
}

struct st: Identifiable, Codable, Hashable {
    var name: String
    var id: Self { self }
}
struct Machine: Identifiable, Codable{
    
    var id: Int
    var name: String
    var type: String
    var Q: Int
    var States = [st]()
    var E = [String]()
    var G = [String]()
    var d = [Transition]()
    var q0: st
    var qaccept = [st]()
    var qreject: String
    var recents = [Input]()
    var selectedItems = Set<st.ID>()
    
    mutating func addRecent(_lastInput: Input) {
        recents.append(_lastInput)
    }
    var recentsValue: [Input] {
        return recents
    }
}
