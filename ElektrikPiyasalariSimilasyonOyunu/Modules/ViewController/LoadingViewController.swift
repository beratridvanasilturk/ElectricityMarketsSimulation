//
//  LoadingViewController.swift
//  ElektrikPiyasalariSimilasyonOyunu
//
//  Created by Berat Rıdvan Asiltürk on 22.05.2022.
//

import Foundation
import UIKit


/// Oyuncularin yuklenmesi ekran sinifi
class LoadingViewController : UIViewController {

    
    /// Oyuncular yuklenirken ekranda animasyon gosterir
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        sleep(2)
        tabloEkranaGec()
    }
    
    
    /// Bir sonraki ekrana gecer
    func tabloEkranaGec(){
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let hedefEkran = storyBoard.instantiateViewController(withIdentifier: "OyuncularTablosuViewController")
        navigationController?.pushViewController(hedefEkran, animated: true)
    }


    
}
