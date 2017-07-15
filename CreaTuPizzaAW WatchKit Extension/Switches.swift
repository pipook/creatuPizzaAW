//
//  Switches.swift
//  CreaTuPizzaAW
//
//  Created by Daniel Chico on 7/14/17.
//  Copyright © 2017 TriquiDev. All rights reserved.
//

import WatchKit

class Switches: NSObject {
    var descripcion: String = ""
    var valorSelection: [String] = []
    var delegate: AnyObject? = nil
    
    init(d: String, v: [String]) {
        self.descripcion = d
        self.valorSelection = v
    }
}
