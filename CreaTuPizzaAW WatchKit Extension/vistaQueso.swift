//
//  vistaQueso.swift
//  CreaTuPizzaAW
//
//  Created by Daniel Chico on 7/11/17.
//  Copyright © 2017 TriquiDev. All rights reserved.
//

import WatchKit
import Foundation


protocol QuesoVistaControllerProtocol {
    func quesoSeleccionadoController(queso: String)
}

class vistaQueso: WKInterfaceController {
    
    var delegate: QuesoVistaControllerProtocol! = nil

    @IBOutlet var pickerQueso: WKInterfacePicker!
    let quesos = ["", "Mozarela", "Cheddar", "Parmesano", "Sin queso"]
    @IBOutlet var quesoSeleccionado: WKInterfaceLabel!
    var queso: String = ""
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        cargarPicker()
        let t = context as! Seleccion
        self.delegate = t.delegate as? QuesoVistaControllerProtocol
        self.quesoSeleccionado.setText(t.valorSelection)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    func cargarPicker() {
        var items: [WKPickerItem] = [WKPickerItem]()
        for queso in self.quesos{
            let item = setItemTitulo(titulo: queso)
            items.append(item)
        }
        pickerQueso.setItems(items)
    }
    func setItemTitulo(titulo: String) -> WKPickerItem {
        let itemPicker = WKPickerItem()
        itemPicker.title = titulo
        return itemPicker
    }

    @IBAction func cambioQueso(_ value: Int) {
        self.queso = quesos[value]
        self.quesoSeleccionado.setText(quesos[value])
        self.delegate?.quesoSeleccionadoController(queso: self.queso )
    }
}
