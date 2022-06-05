//
//  YatirimAraclariViewController.swift
//  ElektrikPiyasalariSimilasyonOyunu
//
//  Created by Berat Rıdvan Asiltürk on 4.06.2022.
//

import UIKit

class YatirimAraclariViewController: UIViewController , YatirimEkraniViewControllerDelegate {
  
    
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
    var yatirimlarim : [YoneticiViewModel.EnerjiTurleri] = []
    
    
    
    var komurTeklifim = 0
    var gunesTeklifim = 0
    var ruzgarTeklifim = 0
    var nukleerTeklifim = 0
    var bioTeklifim = 0
    
    
    
    @IBAction func santralYatirimButtonTapped(_ sender: UIButton) {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let destination = storyBoard.instantiateViewController(withIdentifier: "YatirimEkraniViewController") as! YatirimEkraniViewController
        destination.delegate = self
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
        sliderGuncelle()

        // Do any additional setup after loading the view.
    }
    
    func satinAlindi(enerjiTuru: YoneticiViewModel.EnerjiTurleri) {
        
        if enerjiTuru.satinAlmaMaaliyeti > butce {
                
            print("Alinmak Istenen Santrale Butce Yok")
            
            let title = "Alinmak Istenen Santrale Butce Yok"
            let tamam = UIAlertAction(title: "Tamam", style: .cancel)

            let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
       
            alert.addAction(tamam)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1 ) {
                self.present(alert, animated: true, completion: nil)
            }
        
        
            
            return
        }
        
        butce -= enerjiTuru.satinAlmaMaaliyeti
        butceLabel.text = "\(butce)$"
        
        yatirimlarim.append(enerjiTuru)
        sliderGuncelle()
        
    }
    
    
    /// Bu method yatirim yapildiktan sonra her bir enerji santrali icin o santralin sliderinin kullanimini duzenler
    
    func sliderGuncelle() {
    
        if yatirimlarim.contains(.nukleer) {
            nukleerSliderOutlet.isUserInteractionEnabled = true
        } else {
            nukleerSliderOutlet.isUserInteractionEnabled = false
        }
        if yatirimlarim.contains(.ruzgar) {
            ruzgarSliderOutlet.isUserInteractionEnabled = true
        } else {
            ruzgarSliderOutlet.isUserInteractionEnabled = false
        }
        
        if yatirimlarim.contains(.bio) {
            bioSliderOutlet.isUserInteractionEnabled = true
        } else {
            bioSliderOutlet.isUserInteractionEnabled = false
        }
        
        if yatirimlarim.contains(.komur) {
            komurSliderOutlet.isUserInteractionEnabled = true
        } else {
            komurSliderOutlet.isUserInteractionEnabled = false
        }
        
        if yatirimlarim.contains(.gunes) {
            gunesSliderOutlet.isUserInteractionEnabled = true
        } else {
            gunesSliderOutlet.isUserInteractionEnabled = false
        }
        
        
    }
    
    


}
