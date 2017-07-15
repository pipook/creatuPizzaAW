//
//  vistaIngrediente.swift
//  CreaTuPizzaAW
//
//  Created by Daniel Chico on 7/11/17.
//  Copyright © 2017 TriquiDev. All rights reserved.
//

import WatchKit
import Foundation

protocol IngredienteVistaControllerProtocol {
    func ingredienteSeleccionadoController(ingredienteStr: String, ingredientesArray: [String])
}

class vistaIngrediente: WKInterfaceController {
    
    var delegate: IngredienteVistaControllerProtocol! = nil
    
    var countIngredientes = 0

    @IBOutlet var optionJamon: WKInterfaceSwitch!
    @IBOutlet var optionPepperoni: WKInterfaceSwitch!
    @IBOutlet var optionPavo: WKInterfaceSwitch!
    @IBOutlet var optionSalchicha: WKInterfaceSwitch!
    @IBOutlet var optionAceituna: WKInterfaceSwitch!
    @IBOutlet var optionCebolla: WKInterfaceSwitch!
    @IBOutlet var optionPimiento: WKInterfaceSwitch!
    @IBOutlet var optionPina: WKInterfaceSwitch!
    @IBOutlet var optionAnchoa: WKInterfaceSwitch!
    
    var ingredientes:[String] = []
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        let t = context as! Switches
        self.delegate = t.delegate as? IngredienteVistaControllerProtocol
        for item in t.valorSelection {
            switch(item){
                case "Jamon":
                   self.optionJamon.setOn(true)
                   ingredientes.append(item)
                break
                case "Pepperoni":
                    self.optionPepperoni.setOn(true)
                    ingredientes.append(item)
                break
                case "Pavo":
                    self.optionPavo.setOn(true)
                    ingredientes.append(item)
                break
                case "Salchicha":
                    self.optionSalchicha.setOn(true)
                    ingredientes.append(item)
                break
                case "Aceituna":
                    self.optionAceituna.setOn(true)
                    ingredientes.append(item)
                break
                case "Cebolla":
                    self.optionCebolla.setOn(true)
                    ingredientes.append(item)
                break
                case "Pimiento":
                    self.optionPimiento.setOn(true)
                    ingredientes.append(item)
                break
                case "Piña":
                    self.optionPina.setOn(true)
                    ingredientes.append(item)
                break
                case "Anchoa":
                    self.optionAnchoa.setOn(true)
                    ingredientes.append(item)
                break
                default:
                break
            }
        }
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
        //dump(self.ingredientes)
        let descripcion = self.ingredientes.joined(separator: ",")
        self.delegate.ingredienteSeleccionadoController(ingredienteStr: descripcion, ingredientesArray: self.ingredientes)
        print(descripcion)
    }
    
    @IBAction func switchJamon(_ value: Bool) {
        let val = checkOptions(option: value)
        self.optionJamon.setOn(val)
        if val {
            ingredientes.append("Jamon")
        }else{
            let pos = ingredientes.index(of: "Jamon")
            if pos != nil {
                ingredientes.remove(at: pos!)
            }
        }
    }
    @IBAction func switchPepperoni(_ value: Bool) {
        let val = checkOptions(option: value)
        self.optionPepperoni.setOn(val)
        if val {
            ingredientes.append("Pepperoni")
        }else{
            let pos = ingredientes.index(of: "Pepperoni")
            if pos != nil {
                ingredientes.remove(at: pos!)
            }
        }
    }
    @IBAction func switchPavo(_ value: Bool) {
        let val = checkOptions(option: value)
        self.optionPavo.setOn(val)
        if val {
            ingredientes.append("Pavo")
        }else{
            let pos = ingredientes.index(of: "Pavo")
            if pos != nil {
                ingredientes.remove(at: pos!)
            }
        }
    }
    @IBAction func switchSalchicha(_ value: Bool) {
        let val = checkOptions(option: value)
        self.optionSalchicha.setOn(val)
        if val {
            ingredientes.append("Salchicha")
        }else{
            let pos = ingredientes.index(of: "Salchicha")
            if pos != nil {
                ingredientes.remove(at: pos!)
            }
        }
    }
    @IBAction func switchAceituna(_ value: Bool) {
        let val = checkOptions(option: value)
        self.optionAceituna.setOn(val)
        if val {
            ingredientes.append("Aceituna")
        }else{
            let pos = ingredientes.index(of: "Aceituna")
            if pos != nil {
                ingredientes.remove(at: pos!)
            }
        }
    }
    @IBAction func switchCebolla(_ value: Bool) {
        let val = checkOptions(option: value)
        self.optionCebolla.setOn(val)
        if val {
            ingredientes.append("Cebolla")
        }else{
            let pos = ingredientes.index(of: "Cebolla")
            if pos != nil {
                ingredientes.remove(at: pos!)
            }
        }
    }
    @IBAction func switchPimiento(_ value: Bool) {
        let val = checkOptions(option: value)
        self.optionPimiento.setOn(val)
        if val {
            ingredientes.append("Pimiento")
        }else{
            let pos = ingredientes.index(of: "Pimiento")
            if pos != nil {
                ingredientes.remove(at: pos!)
            }
        }
    }
    @IBAction func switchPina(_ value: Bool) {
        let val = checkOptions(option: value)
        self.optionPina.setOn(val)
        if val {
            ingredientes.append("Piña")
        }else{
            let pos = ingredientes.index(of: "Piña")
            if pos != nil {
                ingredientes.remove(at: pos!)
            }
        }
    }
    @IBAction func switchAnchoa(_ value: Bool) {
        let val = checkOptions(option: value)
        self.optionAnchoa.setOn(val)
        if val {
            ingredientes.append("Anchoa")
        }else{
            let pos = ingredientes.index(of: "Anchoa")
            if pos != nil {
                ingredientes.remove(at: pos!)
            }
        }
    }
    func checkOptions(option: Bool) -> Bool{
        if option {
            if countIngredientes < 5 {
                countIngredientes = countIngredientes + 1
                return true
            } else {
                let actionFirst = WKAlertAction(title: "Aceptar", style: .cancel, handler: {})
                self.presentAlert(withTitle: "Ops!", message: "Solo puede seleccionar 5 ingredientes", preferredStyle: .alert, actions: [actionFirst])
                return false
            }
        } else {
            countIngredientes = countIngredientes - 1
            return false
        }
    }

}
