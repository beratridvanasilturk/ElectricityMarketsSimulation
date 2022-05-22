//
//  OyunHakkindaViewController.swift
//  ElektrikPiyasalariSimilasyonOyunu
//
//  Created by Berat Rıdvan Asiltürk on 22.05.2022.
//

import UIKit

class OyunHakkindaViewController : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(YoneticiViewModel.shared.randomOyuncularGetir())
    }
    
}
