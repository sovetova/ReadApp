//
//  CoreOnboard.swift
//  ReadApp
//
//  Created by Dilsh on 23.12.2021.
//

import Foundation

class Core {
    
    static let Shared = Core()
    
    
    func isNewUser() ->Bool {
        
        return !UserDefaults.standard.bool(forKey: "TestUser222")
    }
    
    func notNewUser() {
        
        UserDefaults.standard.set(true, forKey: "TestUser222")
    }
    
}
