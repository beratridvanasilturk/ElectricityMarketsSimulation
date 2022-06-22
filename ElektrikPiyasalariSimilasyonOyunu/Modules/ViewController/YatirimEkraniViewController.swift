//
//  YatirimEkraniViewController.swift
//  ElektrikPiyasalariSimilasyonOyunu
//
//  Created by Berat Rıdvan Asiltürk on 5.06.2022.
//

import UIKit

/// Bir onceki ekrana hangi enerji santralinin alindiginin bilgisini donmesi icin kullanilir
protocol YatirimEkraniViewControllerDelegate : AnyObject {
    
    func satinAlindi(enerjiTuru : YoneticiViewModel.EnerjiTurleri)
}

class YatirimEkraniViewController: UIViewController {
    
    @IBOutlet weak var gunesButton: UIButton!
    @IBOutlet weak var nukleerButton: UIButton!
    @IBOutlet weak var ruzgarButton: UIButton!
    @IBOutlet weak var bioButton: UIButton!
    @IBOutlet weak var komurButton: UIButton!
    
    
    weak var delegate : YatirimEkraniViewControllerDelegate?
    
    @IBAction func gunesButtonTapped(_ sender: UIButton) {
        alert(enerjiTuru: .gunes)
    }
    @IBAction func komurButtonTapped(_ sender: UIButton) {
        alert(enerjiTuru: .komur)
    }
    @IBAction func bioButtonTapped(_ sender: UIButton) {
        alert(enerjiTuru: .bio)
    }
    
    @IBAction func ruzgarButtonTapped(_ sender: UIButton) {
        alert(enerjiTuru: .ruzgar)
    }
    @IBAction func nukleerButtonTapped(_ sender: UIButton) {
        alert(enerjiTuru: .nukleer)
    }
    
    
    /// Satin alma islemini onaylamak icin kullanici uyarilir
    /// - Parameter enerjiTuru: Satin alinmasi istenen enerji turu
    func alert(enerjiTuru: YoneticiViewModel.EnerjiTurleri) {
        
        var enerjiIsmi : String{
            
            switch enerjiTuru{
            case .ruzgar : return "Ruzgar"
            case .nukleer : return "Nukleer"
            case .komur : return "Komur"
            case .gunes : return "Gunes"
            case .bio : return "Bio"
            }
        
        }
        
        ///Ekrana verilen uyarilardaki buton icerikleri
        let title = enerjiIsmi + " - Bu Santrali Satın Almak İstiyor Musunuz?"
        let vazgec = UIAlertAction(title: "Vazgeç", style: .cancel)
        let satinAl = UIAlertAction(title: "Satın Al", style: .default) { action in
            print("Satin Al Tiklandi")
            self.dismiss(animated: true, completion: nil)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.delegate?.satinAlindi(enerjiTuru: enerjiTuru)
            }
        }
        
        /// Alinmak istenen enerji santrali icin oyuncu uyarilir ve bildirim ekrana basilir
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
   
        alert.addAction(vazgec)
        alert.addAction(satinAl)
        present(alert, animated: true, completion: nil)
    
    }
    
    /// Bu ekran ilk acildigi an tetiklenen methoddur, Oyun ilk acildiginda default degerler atanmalidir
    override func viewDidLoad() {
        super.viewDidLoad()

    
    }
    

}
