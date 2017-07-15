//
//  InterfaceController.swift
//  CreaTuPizzaAW WatchKit Extension
//
//  Created by Daniel Chico on 7/10/17.
//  Copyright © 2017 TriquiDev. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController, TamanoVistaControllerProtocol, MasaVistaControllerProtocol, QuesoVistaControllerProtocol, IngredienteVistaControllerProtocol, ResultadoVistaControllerProtocol {
    

    @IBOutlet var labelTamano: WKInterfaceLabel!
    var tamano: String = ""
    @IBOutlet var labelMasa: WKInterfaceLabel!
    var masa: String = ""
    @IBOutlet var labelQueso: WKInterfaceLabel!
    var queso: String = ""
    @IBOutlet var labelIngrediente: WKInterfaceLabel!
    var ingrediente: String = ""
    var ingredientes:[String] = []
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    @IBAction func actionTamano() {
        let valorContexto = Seleccion(d: "Tamaño seleccionado", v: self.tamano)
        valorContexto.delegate = self
        pushController(withName: "IdentificadorTamano", context: valorContexto)
    }
    @IBAction func actionMasa() {
        let valorContexto = Seleccion(d: "Masa seleccionada", v: self.masa)
        valorContexto.delegate = self
        pushController(withName: "IdentificadorMasa", context: valorContexto)
    }
    @IBAction func actionQueso() {
        let valorContexto = Seleccion(d: "Queso seleccionado", v: self.queso)
        valorContexto.delegate = self
        pushController(withName: "IdentificadorQueso", context: valorContexto)
    }
    @IBAction func actionIngrediente() {
        let valorContexto = Switches(d: self.ingrediente, v: self.ingredientes)
        valorContexto.delegate = self
        pushController(withName: "IdentificadorIngrediente", context: valorContexto)
    }
    @IBAction func actionResultado() {
        let valorContexto = Resultado(t: self.tamano, m: self.masa, q: self.queso, i: self.ingredientes)
        valorContexto.delegate = self
        pushController(withName: "IdentificadorResultado", context: valorContexto)
    }
    func tamanoSeleccionadoController(tamano : String){
        self.tamano = tamano
        labelTamano.setText(tamano)
    }
    func masaSeleccionadoController(masa: String){
        self.masa = masa
        labelMasa.setText(masa)
    }
    func quesoSeleccionadoController(queso: String) {
        self.queso = queso
        labelQueso.setText(queso)
    }
    func ingredienteSeleccionadoController(ingredienteStr: String, ingredientesArray: [String]){
        self.ingrediente = ingredienteStr
        self.ingredientes = ingredientesArray
        labelIngrediente.setText(ingredienteStr)
        if ingredienteStr != "" {
            labelIngrediente.setHeight(CGFloat(integerLiteral: 51))
        }
    }
    func resultadoSeleccionadoController(estaCompleto: Bool){
        if estaCompleto {
            self.labelTamano.setText("")
            self.tamano = ""
            self.labelMasa.setText("")
            self.masa = ""
            self.labelQueso.setText("")
            self.queso = ""
            self.labelIngrediente.setText("")
            self.ingrediente = ""
            self.ingredientes = []
            self.labelIngrediente.setHeight(CGFloat(integerLiteral: 10))
        }
    }

}
