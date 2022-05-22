//
//  KullaniciGirisiViewController.swift
//  ElektrikPiyasalariSimilasyonOyunu
//
//  Created by Berat Rıdvan Asiltürk on 3.03.2022.
//

import UIKit

class KullaniciGirisiViewController: UIViewController {
    
    @IBAction func devamTapped() {
        kullaniciIsmiKaydet()
        hakkindaEkranaGec()

    }
    
    @IBOutlet weak var isimGirisTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func kullaniciIsmiKaydet() {
        YoneticiViewModel.shared.kullaniciIsmi = isimGirisTextField.text
    }
    
    func hakkindaEkranaGec(){
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let hedefEkran = storyBoard.instantiateViewController(withIdentifier: "OyunHakkindaViewController")
        navigationController?.pushViewController(hedefEkran, animated: true)
    }


}
