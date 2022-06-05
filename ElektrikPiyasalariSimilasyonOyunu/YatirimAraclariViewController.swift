//
//  YatirimAraclariViewController.swift
//  ElektrikPiyasalariSimilasyonOyunu
//
//  Created by Berat Rıdvan Asiltürk on 4.06.2022.
//

import UIKit

class YatirimAraclariViewController: UIViewController {
    
    
    @IBOutlet weak var nukleerLabel: UILabel!
    @IBOutlet weak var ruzgarLabel: UILabel!
    @IBOutlet weak var bioLabel: UILabel!
    @IBOutlet weak var komurLabel: UILabel!
    @IBOutlet weak var gunesLabel: UILabel!
    
    
    @IBOutlet weak var gunesSliderOutlet: UISlider!
    @IBOutlet weak var komurSliderOutlet: UISlider!
    @IBOutlet weak var bioSliderOutlet: UISlider!
    @IBOutlet weak var ruzgarSliderOutlet: UISlider!
    @IBOutlet weak var nukleerSliderOutlet: UISlider!
    
    
    @IBOutlet weak var butceLabel: UILabel!
    
    @IBOutlet weak var periyotLabel: UILabel!
    
    
    var periyot = 1
    
    var butce = 200000000
    
    var komurTeklifim = 0
    var gunesTeklifim = 0
    var ruzgarTeklifim = 0
    var nukleerTeklifim = 0
    var bioTeklifim = 0
    
    
    
    @IBAction func santralYatirimButtonTapped(_ sender: UIButton) {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let destination = storyBoard.instantiateViewController(withIdentifier: "YatirimEkraniViewController") as! YatirimEkraniViewController
        present(destination, animated: true, completion: nil)
    }
    
    @IBAction func onaylaButton(_ sender: UIButton) {
        
        if periyot == 10 {
            return
        }
        
        if butce <= 0 {
            return
        }
        
        if bioTeklifim > YoneticiViewModel.shared.minimumTeklifFiyati(enerjiTuru: .bio) {
            butce -= YoneticiViewModel.shared.gelir(teklif: bioTeklifim, enerjiTuru: .bio)
            
            print("✅  Bio Teklifim Kabul Edildi ")
        }
        
        if gunesTeklifim > YoneticiViewModel.shared.minimumTeklifFiyati(enerjiTuru: .gunes) {
            butce -= YoneticiViewModel.shared.gelir(teklif: gunesTeklifim, enerjiTuru: .gunes)
            print("✅  Gunes Teklifim Kabul Edildi ")
        }
        
        if komurTeklifim > YoneticiViewModel.shared.minimumTeklifFiyati(enerjiTuru: .komur) {
            butce -= YoneticiViewModel.shared.gelir(teklif: komurTeklifim, enerjiTuru: .komur)
            print("✅  Komur Teklifim Kabul Edildi ")
        }
        
        if nukleerTeklifim > YoneticiViewModel.shared.minimumTeklifFiyati(enerjiTuru: .nukleer) {
            butce -= YoneticiViewModel.shared.gelir(teklif: nukleerTeklifim, enerjiTuru: .nukleer)
            print("✅  Nuk Teklifim Kabul Edildi ")
        }
        
        if ruzgarTeklifim > YoneticiViewModel.shared.minimumTeklifFiyati(enerjiTuru: .ruzgar) {
            butce -= YoneticiViewModel.shared.gelir(teklif: ruzgarTeklifim, enerjiTuru: .ruzgar)
            print("✅  Ruzgar Teklifim Kabul Edildi ")
        }
        butceLabel.text = "\(butce)$"
        periyot += 1
        periyotLabel.text = "\(periyot)"
        
        
        
        
        komurTeklifim = 0
        gunesTeklifim = 0
        ruzgarTeklifim = 0
        nukleerTeklifim = 0
        bioTeklifim = 0
        
        
        bioSliderOutlet.setValue(0, animated: true)
        komurSliderOutlet.setValue(0, animated: true)
        gunesSliderOutlet.setValue(0, animated: true)
        ruzgarSliderOutlet.setValue(0, animated: true)
        nukleerSliderOutlet.setValue(0, animated: true)
        
        
        nukleerLabel.text = "$"
       ruzgarLabel.text = "$"
       bioLabel.text = "$"
       komurLabel.text = "$"
       gunesLabel.text = "$"
        
        // TODO: defult degerleri sifirla
        
    }
    
    
    
    
    
    @IBAction func komurSlider(_ sender: UISlider) {
        komurTeklifim = Int(sender.value)
        komurLabel.text = "\(komurTeklifim)$"
    }
    @IBAction func gunesSlider(_ sender: UISlider) {
        gunesTeklifim = Int(sender.value)
        gunesLabel.text = "\(gunesTeklifim)$"
        
    }
    @IBAction func bioSlider(_ sender: UISlider) {
        bioTeklifim = Int(sender.value)
        bioLabel.text = "\(bioTeklifim)$"
    }
    
    @IBAction func nukleerSlider(_ sender: UISlider) {
        nukleerTeklifim = Int(sender.value)
        nukleerLabel.text = "\(nukleerTeklifim) $"
    }
    @IBAction func ruzgarSlider(_ sender: UISlider) {
        ruzgarTeklifim = Int(sender.value)
        ruzgarLabel.text = "\(ruzgarTeklifim)$"
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
