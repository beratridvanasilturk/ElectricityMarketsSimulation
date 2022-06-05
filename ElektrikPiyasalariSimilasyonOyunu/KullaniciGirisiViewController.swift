//
//  KullaniciGirisiViewController.swift
//  ElektrikPiyasalariSimilasyonOyunu
//
//  Created by Berat Rıdvan Asiltürk on 3.03.2022.
//

import UIKit


/// Kullanici Giris Ekran Sinifi
class KullaniciGirisiViewController: UIViewController {
    
    
   
    
    /// Kullanicidan alinan isim
    @IBOutlet weak var isimGirisTextField: UITextField!
    
    
    /// Devam butonu tiklandiginda calisacak fonksiyon
    @IBAction func devamTapped() {
        kullaniciIsmiKaydet()
        hakkindaEkranaGec()

    }
    /// Bu ekran ilk acildigi an tetiklenen methoddur
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    /// Kullanicidan alinan ismi kaydeden fonksiyon
    func kullaniciIsmiKaydet() {
        YoneticiViewModel.shared.kullaniciIsmi = isimGirisTextField.text
    }
    
    /// bir sonraki ekrana gecen fonksiyon
    func hakkindaEkranaGec(){
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let hedefEkran = storyBoard.instantiateViewController(withIdentifier: "OyunHakkindaViewController")
        navigationController?.pushViewController(hedefEkran, animated: true)
    }



}
