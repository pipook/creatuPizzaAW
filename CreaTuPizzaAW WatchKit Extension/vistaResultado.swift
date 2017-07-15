//
//  vistaResultado.swift
//  CreaTuPizzaAW
//
//  Created by Daniel Chico on 7/11/17.
//  Copyright © 2017 TriquiDev. All rights reserved.
//

import WatchKit
import Foundation

protocol ResultadoVistaControllerProtocol {
    func resultadoSeleccionadoController(estaCompleto: Bool)
}

class vistaResultado: WKInterfaceController {

    @IBOutlet var tamano: WKInterfaceLabel!
    @IBOutlet var masa: WKInterfaceLabel!
    @IBOutlet var queso: WKInterfaceLabel!
    @IBOutlet var ingredientes: WKInterfaceLabel!
    
    var delegate: ResultadoVistaControllerProtocol! = nil
    var contexto = Resultado(t: "", m: "", q: "", i: [])
    var estaCompleto: Bool = false
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        contexto = context as! Resultado
        self.delegate = contexto.delegate as? ResultadoVistaControllerProtocol
        self.tamano.setText(contexto.tamano)
        self.masa.setText(contexto.masa)
        self.queso.setText(contexto.queso)
        if !contexto.ingredientes.isEmpty {
            self.ingredientes.setHeight(CGFloat(integerLiteral: 51))
        }
        self.ingredientes.setText(contexto.ingredientes.joined(separator: ","))
        self.delegate.resultadoSeleccionadoController(estaCompleto: false)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    @IBAction func confirmarPizza() {
        if self.contexto.tamano == "" || self.contexto.masa == "" || self.contexto.queso == "" || self.contexto.ingredientes.isEmpty {
            let actionFirst = WKAlertAction(title: "Aceptar", style: .cancel, handler: {})
            self.presentAlert(withTitle: "Ops!", message: "Su pedido no esta completo, debe seleccionar todos los items", preferredStyle: .alert, actions: [actionFirst])
        }else{
            let actionSi = WKAlertAction(title: "Si", style: .default, handler: {
                //self.estaCompleto = true
                let actionOk = WKAlertAction(title: "Aceptar", style: .default, handler: {
                    self.tamano.setText("")
                    self.masa.setText("")
                    self.queso.setText("")
                    self.ingredientes.setText("")
                    self.ingredientes.setHeight(CGFloat(integerLiteral: 10))
                    self.estaCompleto = true
                    self.contexto = Resultado(t: "", m: "", q: "", i: [])
                    self.delegate.resultadoSeleccionadoController(estaCompleto: true)
                })
                self.presentAlert(withTitle: "Exito!", message: "Su pedido fue realizado exitosamente", preferredStyle: .alert, actions: [actionOk])
            })
            let actionNo = WKAlertAction(title: "No", style: .destructive, handler: {})
            self.presentAlert(withTitle: "Bien!", message: "Desea confirmar su orden de pizza?", preferredStyle: .sideBySideButtonsAlert, actions: [actionSi, actionNo])
            if self.estaCompleto {
                print("Completado...")
            }
        }
    }

}
