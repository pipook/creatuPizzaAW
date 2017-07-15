//
//  vistaMasa.swift
//  CreaTuPizzaAW
//
//  Created by Daniel Chico on 7/11/17.
//  Copyright © 2017 TriquiDev. All rights reserved.
//

import WatchKit
import Foundation


protocol MasaVistaControllerProtocol {
    func masaSeleccionadoController(masa: String)
}

class vistaMasa: WKInterfaceController {
    
    var delegate: MasaVistaControllerProtocol! = nil

    @IBOutlet var pickerMasa: WKInterfacePicker!
    let masas = ["", "Delgada", "Crujiente", "Gruesa"]
    @IBOutlet var masaSeleccionada: WKInterfaceLabel!
    var masa: String = ""
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        cargarPicker()
        let t = context as! Seleccion
        self.delegate = t.delegate as? MasaVistaControllerProtocol
        self.masaSeleccionada.setText(t.valorSelection)
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
        for masa in self.masas{
            let item = setItemTitulo(titulo: masa)
            items.append(item)
        }
        pickerMasa.setItems(items)
    }
    func setItemTitulo(titulo: String) -> WKPickerItem {
        let itemPicker = WKPickerItem()
        itemPicker.title = titulo
        return itemPicker
    }

    @IBAction func cambioMasa(_ value: Int) {
        self.masa = masas[value]
        self.masaSeleccionada.setText(masas[value])
        self.delegate?.masaSeleccionadoController(masa: self.masa )
    }
}
