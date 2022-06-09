//
//  OyunHakkindaViewController.swift
//  ElektrikPiyasalariSimilasyonOyunu
//
//  Created by Berat Rıdvan Asiltürk on 22.05.2022.
//

import UIKit

/// Oyun Hakkinda Ekran Sinifi
class OyunHakkindaViewController : UIViewController {
    
    /// Bu ekran ilk acildigi an tetiklenen methoddur
    override func viewDidLoad() {
        super.viewDidLoad()
        print(YoneticiViewModel.shared.secilenOyuncularGetir)
    }
    
}
