//
//  AfterLunchViewController.swift
//  ElektrikPiyasalariSimilasyonOyunu
//
//  Created by Berat Rıdvan Asiltürk on 3.03.2022.
//

import UIKit


/// Uygulama ilk acildiginda ekrana basilan bolum fotograf baskisi
class AfterLunchViewController: UIViewController {

    /// Bu ekran ilk acildigi an tetiklenen methoddur
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // gecici sureli ekranda tutar (3sn)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.kullaniciEkraniAc()
        }
 
      
    }
    
    /// Kullanici bilgilerini girmesi icin giris ekrani acar
    func kullaniciEkraniAc(){
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let hedefEkran = storyBoard.instantiateViewController(withIdentifier: "KullaniciGirisEkrani")
        navigationController?.pushViewController(hedefEkran, animated: true)
    }

}
