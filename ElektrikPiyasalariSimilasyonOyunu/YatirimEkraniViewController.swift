//
//  YatirimEkraniViewController.swift
//  ElektrikPiyasalariSimilasyonOyunu
//
//  Created by Berat Rıdvan Asiltürk on 5.06.2022.
//

import UIKit

class YatirimEkraniViewController: UIViewController {
    
    @IBOutlet weak var gunesButton: UIButton!
    @IBOutlet weak var nukleerButton: UIButton!
    @IBOutlet weak var ruzgarButton: UIButton!
    @IBOutlet weak var bioButton: UIButton!
    @IBOutlet weak var komurButton: UIButton!
    
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
        let title = enerjiIsmi + "Enerji Santralini Satin Almak Istiyor Musunuz?"
        let vazgec = UIAlertAction(title: "Vazgec", style: .cancel)
        let satinAl = UIAlertAction(title: "Satin Al", style: .default) { action in
            print("Satin Al Tiklandi")
        }
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
   
        alert.addAction(vazgec)
        alert.addAction(satinAl)
        present(alert, animated: true, completion: nil)
    
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
