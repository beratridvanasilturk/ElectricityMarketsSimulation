//
//  YatirimAraclariViewController.swift
//  ElektrikPiyasalariSimilasyonOyunu
//
//  Created by Berat Rıdvan Asiltürk on 4.06.2022.
//

import UIKit
import Loaf

class YatirimAraclariViewController: UIViewController , YatirimEkraniViewControllerDelegate {
    
    
    
    
    @IBOutlet weak var nukleerLabel: UILabel!
    @IBOutlet weak var ruzgarLabel: UILabel!
    @IBOutlet weak var bioLabel: UILabel!
    @IBOutlet weak var komurLabel: UILabel!
    @IBOutlet weak var gunesLabel: UILabel!
    @IBOutlet weak var butceLabel: UILabel!
    @IBOutlet weak var periyotLabel: UILabel!
    
    @IBOutlet weak var gunesSliderOutlet: UISlider!
    @IBOutlet weak var komurSliderOutlet: UISlider!
    @IBOutlet weak var bioSliderOutlet: UISlider!
    @IBOutlet weak var ruzgarSliderOutlet: UISlider!
    @IBOutlet weak var nukleerSliderOutlet: UISlider!
    
    ///Her bir santral icin default atanan baslangic degerleri
    var bioSatinAlinanPeriyot: Int?
    var komurSatinAlinanPeriyot: Int?
    var nukSatinAlinanPeriyot: Int?
    var ruzgarSatinAlinanPeriyot: Int?
    var gunesSatinAlinanPeriyot: Int?
    
    
    /// Oyun baslangicinda kullaniciya verilen butce
    var butce = YoneticiViewModel.shared.baslangicButcesi
    
    /// Oyuncunun yatirim yaptigi enerji santralleri
    /// Satin alinan santraller bu degiskende tutulur
    var yatirimlarim : [YoneticiViewModel.EnerjiTurleri] = []
    
    /// Kullanicinin O Periyotta Verdigi Teklif
    /// Her Periyot Sifirlanir
    var komurTeklifim = 0
    var gunesTeklifim = 0
    var ruzgarTeklifim = 0
    var nukleerTeklifim = 0
    var bioTeklifim = 0
    
    
    
    
    /// Santal Yatirimi Butonu Tiklandiginda Tetiklenir ve Oyuncunun Alabilecegi Santaller Ekrana Gelir
    @IBAction func santralYatirimButtonTapped(_ sender: UIButton) {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let destination = storyBoard.instantiateViewController(withIdentifier: "YatirimEkraniViewController") as! YatirimEkraniViewController
        destination.delegate = self
        present(destination, animated: true, completion: nil)
        
    }
    
    fileprivate func kullaniciGelirleriniHesapla() {
        /// Bio Yakit santarlin omru toplam periyottan kucuk esitse ve
        /// Bio Yakit santralin aktiflesme donemi ile satin alinan andaki periyotun oyun geneli toplam periyottan kucuk ve esit olmasi kosulunda ancak kodu calistiran kosul
        if let bioSatinAlinanPeriyot = bioSatinAlinanPeriyot,
           bioTeklifim > YoneticiViewModel.shared.minimumTeklifFiyati(YoneticiViewModel.shared.periyot, enerjiTuru: .bio),
           YoneticiViewModel.EnerjiTurleri.bio.santralinOmru >= YoneticiViewModel.shared.periyot,
           YoneticiViewModel.EnerjiTurleri.gunes.santralinAktiflesmeDonemi + bioSatinAlinanPeriyot <= YoneticiViewModel.shared.periyot {
            butce += YoneticiViewModel.shared.gelir(teklif: bioTeklifim, enerjiTuru: .bio)
            Loaf(" Bio Santral Teklifi Kabul Edildi", state: .success, sender: self).show(.custom(1))
        }
        /// Gunes santarlin omru toplam periyottan kucuk esitse ve
        /// Gunes santralin aktiflesme donemi ile satin alinan andaki periyotun oyun geneli toplam periyottan kucuk ve esit olmasi kosulunda ancak kodu calistiran kosul
        if let gunesSatinAlinanPeriyot = gunesSatinAlinanPeriyot,
           gunesTeklifim > YoneticiViewModel.shared.minimumTeklifFiyati(YoneticiViewModel.shared.periyot, enerjiTuru: .gunes),
           YoneticiViewModel.EnerjiTurleri.gunes.santralinOmru >= YoneticiViewModel.shared.periyot,
           YoneticiViewModel.EnerjiTurleri.gunes.santralinAktiflesmeDonemi + gunesSatinAlinanPeriyot <= YoneticiViewModel.shared.periyot {
            butce += YoneticiViewModel.shared.gelir(teklif: gunesTeklifim, enerjiTuru: .gunes)
            Loaf(" Gunes Santral Teklifi Kabul Edildi", state: .success, sender: self).show(.custom(1.4))
        }
        
        /// Komur santarlin omru toplam periyottan kucuk esitse ve
        /// Komur santralin aktiflesme donemi ile satin alinan andaki periyotun oyun geneli toplam periyottan kucuk ve esit olmasi kosulunda ancak kodu calistiran kosul
        if let komurSatinAlinanPeriyot = komurSatinAlinanPeriyot,
           komurTeklifim > YoneticiViewModel.shared.minimumTeklifFiyati(YoneticiViewModel.shared.periyot, enerjiTuru: .komur),
           YoneticiViewModel.EnerjiTurleri.komur.santralinOmru >= YoneticiViewModel.shared.periyot,
           YoneticiViewModel.EnerjiTurleri.komur.santralinAktiflesmeDonemi + komurSatinAlinanPeriyot <= YoneticiViewModel.shared.periyot {
            butce += YoneticiViewModel.shared.gelir(teklif: komurTeklifim, enerjiTuru: .komur)
            Loaf(" Komur Santral Teklifi Kabul Edildi", state: .success, sender: self).show(.custom(1.4))
        }
        /// Nukleer santarlin omru toplam periyottan kucuk esitse ve
        /// Nukleer santralin aktiflesme donemi ile satin alinan andaki periyotun oyun geneli toplam periyottan kucuk ve esit olmasi kosulunda ancak kodu calistiran kosul
        if let nukSatinAlinanPeriyot = nukSatinAlinanPeriyot,
           nukleerTeklifim > YoneticiViewModel.shared.minimumTeklifFiyati(YoneticiViewModel.shared.periyot, enerjiTuru: .nukleer),
           YoneticiViewModel.EnerjiTurleri.nukleer.santralinOmru >= YoneticiViewModel.shared.periyot,
           YoneticiViewModel.EnerjiTurleri.nukleer.santralinAktiflesmeDonemi + nukSatinAlinanPeriyot <= YoneticiViewModel.shared.periyot {
            butce += YoneticiViewModel.shared.gelir(teklif: nukleerTeklifim, enerjiTuru: .nukleer)
            Loaf(" Nukleer Santral Teklifi Kabul Edildi", state: .success, sender: self).show(.custom(1.4))
        }
        /// Ruzgar santarlin omru toplam periyottan kucuk esitse ve
        /// ruzgar santralin aktiflesme donemi ile satin alinan andaki periyotun oyun geneli toplam periyottan kucuk ve esit olmasi kosulunda ancak kodu calistiran kosul
        if let ruzgarSatinAlinanPeriyot = ruzgarSatinAlinanPeriyot,
           ruzgarTeklifim > YoneticiViewModel.shared.minimumTeklifFiyati(YoneticiViewModel.shared.periyot, enerjiTuru: .ruzgar),
           YoneticiViewModel.EnerjiTurleri.ruzgar.santralinOmru >= YoneticiViewModel.shared.periyot,
           YoneticiViewModel.EnerjiTurleri.ruzgar.santralinAktiflesmeDonemi + ruzgarSatinAlinanPeriyot <= YoneticiViewModel.shared.periyot {
            
            butce += YoneticiViewModel.shared.gelir(teklif: ruzgarTeklifim, enerjiTuru: .ruzgar)
            Loaf(" Ruzgar Santral Teklifi Kabul Edildi", state: .success, sender: self).show(.custom(1.4))
        }
    }
    
    fileprivate func uiGuncelle() {
        
        // Her periyotta Ui guncellenir
        butceLabel.text = "\(butce)$"
        YoneticiViewModel.shared.periyot += 1
        periyotLabel.text = "\(YoneticiViewModel.shared.periyot)"
        
        // Default degerler atanir
        komurTeklifim = 0
        gunesTeklifim = 0
        ruzgarTeklifim = 0
        nukleerTeklifim = 0
        bioTeklifim = 0
        
        //Default degerler atanir
        sliderGuncelle()
        
        bioSliderOutlet.setValue(0, animated: true)
        komurSliderOutlet.setValue(0, animated: true)
        gunesSliderOutlet.setValue(0, animated: true)
        ruzgarSliderOutlet.setValue(0, animated: true)
        nukleerSliderOutlet.setValue(0, animated: true)
        
        //Default degerler atanir
        nukleerLabel.text = "$"
        ruzgarLabel.text = "$"
        bioLabel.text = "$"
        komurLabel.text = "$"
        gunesLabel.text = "$"
    }
    
    /// Oyuncunun o periyottaki teklifini onaylatmak icin kullanilan butondur.
    @IBAction func onaylaButton(_ sender: UIButton) {
        
        // Oyunun toplam tur sayisi
        if YoneticiViewModel.shared.periyot == 10 {
            print("OYUN BITTI !!!")
            print("KAZANAN OYUNCU: \(YoneticiViewModel.shared.butceyeGoreSiralananOyuncular.first) ")
            print("ISTE BUTCEYE GORE SIRALAMA: \(YoneticiViewModel.shared.butceyeGoreSiralananOyuncular) ")
            return
        }
        // Butcenin sifirin altina dusmesi durumunda oyun sonlanir
        if butce <= 0 {
            print("Butce eksiye dustugu icin sirket bu andan itibaren batik durumdadir.")
            return
        }

        kullaniciGelirleriniHesapla()
        uiGuncelle()
        
        YoneticiViewModel.shared.oyuncular.forEach { $0.teklifiOnayla() }
        
    }
    

    
    // Sliderlarin Oyuncunun Sectigi Tekliflere Gore Ui Guncellenir
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
    
    /// Bu ekran ilk acildigi an tetiklenen methoddur, Oyun ilk acildiginda default degerler atanmalidir
    override func viewDidLoad() {
        super.viewDidLoad()
        sliderGuncelle()
    }
    
    /// Yatirim Ekranindan Enerji Santrali Satin Alindiginda Tetiklenir,
    /// Butcenin olmadigi durumda kullaniciya uyari gider, ancak butce varsa satin alma islemi gerceklesir
    /// Oyun geregi kullanici bir santral aldiginda teklif vermeye baslayabilir
    func satinAlindi(enerjiTuru: YoneticiViewModel.EnerjiTurleri) {
        
        ///Alinmak istenen santralin maliyeti o anki butceden buyukse oyuncuya uyari bildirimi atilir
        if enerjiTuru.satinAlmaMaliyeti > butce {
            
            print("Alınmak İstenen Santrale Yeterli Bütçe Yok")
            
            let title = "Alınmak İstenen Santrale Yeterli Bütçe Yok"
            let tamam = UIAlertAction(title: "Tamam", style: .cancel)
            
            let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
            
            alert.addAction(tamam)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1 ) {
                self.present(alert, animated: true, completion: nil)
            }
            
            
            
            return
        }
        /// Yatirim sonrasi butce ve ui guncellenir
        butce -= enerjiTuru.satinAlmaMaliyeti
        butceLabel.text = "\(butce)$"
        
        yatirimlarim.append(enerjiTuru)
        sliderGuncelle()
        
        print(" 🔥 Şu santral satın alındı : \(enerjiTuru)")
        
        ///Her bir santralin ne zaman satin alindigini belirleyen durum
        switch enerjiTuru {
        case .ruzgar :
            ruzgarSatinAlinanPeriyot = YoneticiViewModel.shared.periyot
        case .nukleer :
            nukSatinAlinanPeriyot = YoneticiViewModel.shared.periyot
        case .bio :
            bioSatinAlinanPeriyot = YoneticiViewModel.shared.periyot
        case .gunes :
            gunesSatinAlinanPeriyot = YoneticiViewModel.shared.periyot
        case .komur :
            komurSatinAlinanPeriyot = YoneticiViewModel.shared.periyot
        }
    }
    
    
    /// Bu method yatirim yapildiktan sonra her bir enerji santrali icin o santralin sliderinin kullanimini duzenler
    func sliderGuncelle() {
        
        if let nukSatinAlinanPeriyot = nukSatinAlinanPeriyot,
           YoneticiViewModel.EnerjiTurleri.nukleer.santralinOmru >= YoneticiViewModel.shared.periyot,
           YoneticiViewModel.EnerjiTurleri.nukleer.santralinAktiflesmeDonemi + nukSatinAlinanPeriyot <= YoneticiViewModel.shared.periyot,
           yatirimlarim.contains(.nukleer) {
            nukleerSliderOutlet.isUserInteractionEnabled = true
        } else {
            nukleerSliderOutlet.isUserInteractionEnabled = false
        }
        if let ruzgarSatinAlinanPeriyot = ruzgarSatinAlinanPeriyot,
           YoneticiViewModel.EnerjiTurleri.ruzgar.santralinOmru >= YoneticiViewModel.shared.periyot,
           YoneticiViewModel.EnerjiTurleri.ruzgar.santralinAktiflesmeDonemi + ruzgarSatinAlinanPeriyot <= YoneticiViewModel.shared.periyot,
           yatirimlarim.contains(.ruzgar) {
            ruzgarSliderOutlet.isUserInteractionEnabled = true
        } else {
            ruzgarSliderOutlet.isUserInteractionEnabled = false
        }
        
        if let bioSatinAlinanPeriyot = bioSatinAlinanPeriyot,
           YoneticiViewModel.EnerjiTurleri.bio.santralinOmru >= YoneticiViewModel.shared.periyot,
           YoneticiViewModel.EnerjiTurleri.bio.santralinAktiflesmeDonemi + bioSatinAlinanPeriyot <= YoneticiViewModel.shared.periyot,
           yatirimlarim.contains(.bio)
        {
            bioSliderOutlet.isUserInteractionEnabled = true
        } else {
            bioSliderOutlet.isUserInteractionEnabled = false
        }
        
        if let komurSatinAlinanPeriyot = komurSatinAlinanPeriyot,
           YoneticiViewModel.EnerjiTurleri.komur.santralinOmru >= YoneticiViewModel.shared.periyot,
           YoneticiViewModel.EnerjiTurleri.komur.santralinAktiflesmeDonemi + komurSatinAlinanPeriyot <= YoneticiViewModel.shared.periyot,
           yatirimlarim.contains(.komur) {
            komurSliderOutlet.isUserInteractionEnabled = true
        } else {
            komurSliderOutlet.isUserInteractionEnabled = false
        }
        
        if let gunesSatinAlinanPeriyot = gunesSatinAlinanPeriyot,
           YoneticiViewModel.EnerjiTurleri.gunes.santralinOmru >= YoneticiViewModel.shared.periyot,
           YoneticiViewModel.EnerjiTurleri.gunes.santralinAktiflesmeDonemi + gunesSatinAlinanPeriyot <= YoneticiViewModel.shared.periyot,
           yatirimlarim.contains(.gunes)
        {
            gunesSliderOutlet.isUserInteractionEnabled = true
        } else {
            gunesSliderOutlet.isUserInteractionEnabled = false
        }
        
    }
    
    
    
}
