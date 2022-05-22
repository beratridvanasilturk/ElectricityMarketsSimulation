//
//  AfterLunchViewController.swift
//  ElektrikPiyasalariSimilasyonOyunu
//
//  Created by Berat Rıdvan Asiltürk on 3.03.2022.
//

import UIKit

class AfterLunchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // gecici sureli ekranda tutma
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.kullaniciEkraniAc()
        }
 
      
    }

    func kullaniciEkraniAc(){
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let hedefEkran = storyBoard.instantiateViewController(withIdentifier: "KullaniciGirisEkrani")
        navigationController?.pushViewController(hedefEkran, animated: true)
    }

}
