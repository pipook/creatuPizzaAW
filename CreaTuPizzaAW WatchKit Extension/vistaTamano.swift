//
//  vistaTamano.swift
//  CreaTuPizzaAW
//
//  Created by Daniel Chico on 7/11/17.
//  Copyright © 2017 TriquiDev. All rights reserved.
//

import WatchKit
import Foundation


protocol TamanoVistaControllerProtocol {
    func tamanoSeleccionadoController(tamano: String)
}

class vistaTamano: WKInterfaceController {
    
    var delegate: TamanoVistaControllerProtocol! = nil
    
    @IBOutlet var pickerTamano: WKInterfacePicker!
    let tamanos = ["", "Chica", "Mediana", "Grande"]
    @IBOutlet var tamanoSeleccionado: WKInterfaceLabel!
    var tamano: String = ""
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        cargarPicker()
        let t = context as! Seleccion
        self.delegate = t.delegate as? TamanoVistaControllerProtocol
        self.tamanoSeleccionado.setText(t.valorSelection)
        //print(t.valorSelection)
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
        for tamano in self.tamanos{
            let item = setItemTitulo(titulo: tamano)
            items.append(item)
        }
        pickerTamano.setItems(items)
    }
    func setItemTitulo(titulo: String) -> WKPickerItem {
        let itemPicker = WKPickerItem()
        itemPicker.title = titulo
        return itemPicker
    }

    @IBAction func cambioTamano(_ value: Int) {
        //print(value)
        self.tamano = tamanos[value]
        self.tamanoSeleccionado.setText(tamanos[value])
        self.delegate?.tamanoSeleccionadoController(tamano: self.tamano )
    }
}
