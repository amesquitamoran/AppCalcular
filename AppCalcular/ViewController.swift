//
//  ViewController.swift
//  AppCalcular
//
//  Created by Eder on 1/02/24.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var resultadoDescuento: UILabel!
    @IBOutlet weak var Resultado: UILabel!
    
    @IBOutlet weak var Porcentajetxt: UITextField!
    @IBOutlet weak var Cantidadtxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //empujar la app hacia arriba cuando se habre el teclado en telefeono chicos
        NotificationCenter.default.addObserver(self, selector: #selector(tecladoUp) ,name: UIResponder.keyboardDidShowNotification,object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(tecladoDown) ,name: UIResponder.keyboardDidHideNotification,object: nil)
    }
    
    @objc func tecladoUp(){
        let sizeScreen = UIScreen.main.nativeBounds.height
        if sizeScreen == 1136 {
            if self.view.frame.origin.y == 0{
                self.view.frame.origin.y = -50
            }
        }
        
    }
    @objc func tecladoDown(){
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    //ELIMINAR TECLADO
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    
    @IBAction func Calcularbtn(_ sender: Any) {
        guard let cantidad = Cantidadtxt.text else { return  }
        guard let porcentaje = Porcentajetxt.text else { return  }
        let cant = (cantidad as NSString).floatValue
        let porciento = (porcentaje as NSString).floatValue
        
        let desc = cant * porciento/100
        let resultado = cant - desc
        
        Resultado.text = "$\(resultado)"
        resultadoDescuento.text = "$\(desc)"
        
        self.view.endEditing(true)
    }
    
    @IBAction func Limpiarbtn(_ sender: Any) {
        Cantidadtxt.text=""
        Porcentajetxt.text=""
        Resultado.text = "$0.00"
        resultadoDescuento.text = "$0.00"
    }
    
}

