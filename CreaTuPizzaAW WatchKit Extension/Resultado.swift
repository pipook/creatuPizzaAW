//
//  Resultado.swift
//  CreaTuPizzaAW
//
//  Created by Daniel Chico on 7/14/17.
//  Copyright © 2017 TriquiDev. All rights reserved.
//

import WatchKit

class Resultado: NSObject {
    var tamano: String = ""
    var masa: String = ""
    var queso: String = ""
    var ingredientes: [String] = []
    var delegate: AnyObject? = nil
    
    init(t: String, m: String, q: String, i: [String]) {
        self.tamano = t
        self.masa = m
        self.queso = q
        self.ingredientes = i
    }

}
