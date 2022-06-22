//
//  YatirimAraclariViewController.swift
//  ElektrikPiyasalariSimilasyonOyunu
//
//  Created by Berat Rıdvan Asiltürk on 4.06.2022.
//

import UIKit
import Loaf
import Format

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
    
    var kullanici = YoneticiViewModel.shared.kullanici

    /// Santal Yatirimi Butonu Tiklandiginda Tetiklenir ve Oyuncunun Alabilecegi Santaller Ekrana Gelir
    @IBAction func santralYatirimButtonTapped(_ sender: UIButton) {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let destination = storyBoard.instantiateViewController(withIdentifier: "YatirimEkraniViewController") as! YatirimEkraniViewController
        destination.delegate = self
        present(destination, animated: true, completion: nil)
        
    }
    
    @IBAction func gunesBilgiButton(_ sender: UIButton) {
        Loaf("""
            Güneş Santral Kullanım Ömrü: 5
            Santralin Aktifleşme Dönemi: 1
            """, state: .info, sender: self).show(.custom(3))
    }
    
    
    @IBAction func komurBilgiButton(_ sender: UIButton) {
        Loaf("""
             Kömür Santral Kullanım Ömrü: 6
             Santralin Aktifleşme Dönemi: 1
             """, state: .info, sender: self).show(.custom(3))
    }
    
    @IBAction func bioBilgiButton(_ sender: UIButton) {
        Loaf("""
             Bio Santral Kullanım Ömrü: 10
             Santralin Aktifleşme Dönemi: 2
             """, state: .info, sender: self).show(.custom(3))
    }
    
    
    @IBAction func ruzgarBilgiButton(_ sender: UIButton) {
        Loaf("""
             Rüzgar Santral Kullanım Ömrü: 4
             Santralin Aktifleşme Dönemi: 1
             """, state: .info, sender: self).show(.custom(3))
    }
    
    @IBAction func nukleerBilgiButton(_ sender: UIButton) {
        Loaf("""
             Nukleer Santral Kullanım Ömrü: 10
             Santralin Aktifleşme Dönemi: 2
             """, state: .info, sender: self).show(.custom(3))
    }
    
    @IBAction func periyotBilgiButton(_ sender: UIButton) {
        Loaf("""
             Oyun 10. Periyotta Sona Erer !
             """, state: .warning, sender: self).show(.custom(3))
    }
    

    
    
    
    fileprivate func kullaniciGelirleriniHesapla() {
        /// Bio Yakit santarlin omru toplam periyottan kucuk esitse ve
        /// Bio Yakit santralin aktiflesme donemi ile satin alinan andaki periyotun oyun geneli toplam periyottan kucuk ve esit olmasi kosulunda ancak kodu calistiran kosul
        if let bioSatinAlinanPeriyot = kullanici.bioSatinAlinanPeriyot,
           kullanici.bioTeklifi > YoneticiViewModel.shared.minimumTeklifFiyati(YoneticiViewModel.shared.periyot, enerjiTuru: .bio),
           YoneticiViewModel.EnerjiTurleri.bio.santralinOmru >= YoneticiViewModel.shared.periyot,
           YoneticiViewModel.EnerjiTurleri.gunes.santralinAktiflesmeDonemi + bioSatinAlinanPeriyot <= YoneticiViewModel.shared.periyot {
            kullanici.butce += YoneticiViewModel.shared.gelir(teklif: kullanici.bioTeklifi, enerjiTuru: .bio)
            Loaf(" Bio Yakıt Santral Teklifi Kabul Edildi", state: .success, sender: self).show(.custom(1))
        }
        /// Gunes santarlin omru toplam periyottan kucuk esitse ve
        /// Gunes santralin aktiflesme donemi ile satin alinan andaki periyotun oyun geneli toplam periyottan kucuk ve esit olmasi kosulunda ancak kodu calistiran kosul
        if let gunesSatinAlinanPeriyot = kullanici.gunesSatinAlinanPeriyot,
           kullanici.gunesTeklifi > YoneticiViewModel.shared.minimumTeklifFiyati(YoneticiViewModel.shared.periyot, enerjiTuru: .gunes),
           YoneticiViewModel.EnerjiTurleri.gunes.santralinOmru >= YoneticiViewModel.shared.periyot,
           YoneticiViewModel.EnerjiTurleri.gunes.santralinAktiflesmeDonemi + gunesSatinAlinanPeriyot <= YoneticiViewModel.shared.periyot {
            kullanici.butce += YoneticiViewModel.shared.gelir(teklif: kullanici.gunesTeklifi, enerjiTuru: .gunes)
            Loaf(" Gunes Enerji Santral Teklifi Kabul Edildi", state: .success, sender: self).show(.custom(1.4))
        }
        
        /// Komur santarlin omru toplam periyottan kucuk esitse ve
        /// Komur santralin aktiflesme donemi ile satin alinan andaki periyotun oyun geneli toplam periyottan kucuk ve esit olmasi kosulunda ancak kodu calistiran kosul
        if let komurSatinAlinanPeriyot = kullanici.komurSatinAlinanPeriyot,
           kullanici.komurTeklifi > YoneticiViewModel.shared.minimumTeklifFiyati(YoneticiViewModel.shared.periyot, enerjiTuru: .komur),
           YoneticiViewModel.EnerjiTurleri.komur.santralinOmru >= YoneticiViewModel.shared.periyot,
           YoneticiViewModel.EnerjiTurleri.komur.santralinAktiflesmeDonemi + komurSatinAlinanPeriyot <= YoneticiViewModel.shared.periyot {
            kullanici.butce += YoneticiViewModel.shared.gelir(teklif: kullanici.komurTeklifi, enerjiTuru: .komur)
            Loaf(" Komur Santral Teklifi Kabul Edildi", state: .success, sender: self).show(.custom(1.4))
        }
        /// Nukleer santarlin omru toplam periyottan kucuk esitse ve
        /// Nukleer santralin aktiflesme donemi ile satin alinan andaki periyotun oyun geneli toplam periyottan kucuk ve esit olmasi kosulunda ancak kodu calistiran kosul
        if let nukSatinAlinanPeriyot = kullanici.nukSatinAlinanPeriyot,
           kullanici.nukleerTeklifi > YoneticiViewModel.shared.minimumTeklifFiyati(YoneticiViewModel.shared.periyot, enerjiTuru: .nukleer),
           YoneticiViewModel.EnerjiTurleri.nukleer.santralinOmru >= YoneticiViewModel.shared.periyot,
           YoneticiViewModel.EnerjiTurleri.nukleer.santralinAktiflesmeDonemi + nukSatinAlinanPeriyot <= YoneticiViewModel.shared.periyot {
            kullanici.butce += YoneticiViewModel.shared.gelir(teklif: kullanici.nukleerTeklifi, enerjiTuru: .nukleer)
            Loaf(" Nukleer Enerji Santral Teklifi Kabul Edildi", state: .success, sender: self).show(.custom(1.4))
        }
        /// Ruzgar santarlin omru toplam periyottan kucuk esitse ve
        /// ruzgar santralin aktiflesme donemi ile satin alinan andaki periyotun oyun geneli toplam periyottan kucuk ve esit olmasi kosulunda ancak kodu calistiran kosul
        if let ruzgarSatinAlinanPeriyot = kullanici.ruzgarSatinAlinanPeriyot,
           kullanici.ruzgarTeklifi > YoneticiViewModel.shared.minimumTeklifFiyati(YoneticiViewModel.shared.periyot, enerjiTuru: .ruzgar),
           YoneticiViewModel.EnerjiTurleri.ruzgar.santralinOmru >= YoneticiViewModel.shared.periyot,
           YoneticiViewModel.EnerjiTurleri.ruzgar.santralinAktiflesmeDonemi + ruzgarSatinAlinanPeriyot <= YoneticiViewModel.shared.periyot {
            
            kullanici.butce += YoneticiViewModel.shared.gelir(teklif: kullanici.ruzgarTeklifi, enerjiTuru: .ruzgar)
            Loaf(" Ruzgar Enerji Santral Teklifi Kabul Edildi", state: .success, sender: self).show(.custom(1.4))
        }
    }
    
    fileprivate func uiGuncelle() {
        
        // Her periyotta Ui guncellenir
        butceUiGuncelle()
        
        YoneticiViewModel.shared.periyot += 1
        periyotLabel.text = "\(YoneticiViewModel.shared.periyot)"
        
        // Default degerler atanir
        kullanici.komurTeklifi = 0
        kullanici.gunesTeklifi = 0
        kullanici.ruzgarTeklifi = 0
        kullanici.nukleerTeklifi = 0
        kullanici.bioTeklifi = 0
        
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
        if kullanici.butce <= 0 {
            print("Bütçe sıfır ve altına düştüğü andan itibaren şirket artık batık durumdadır.")
            return
        }

        kullaniciGelirleriniHesapla()
        uiGuncelle()
        
        YoneticiViewModel.shared.oyuncular.forEach { $0.teklifiOnayla() }
        YoneticiViewModel.shared.oyuncular.forEach { $0.sonucuYazdir() }
    }
    

    
    // Sliderlarin Oyuncunun Sectigi Tekliflere Gore Ui Guncellenir
    @IBAction func komurSlider(_ sender: UISlider) {
        kullanici.komurTeklifi = Int(sender.value)
        komurLabel.text = "\(kullanici.komurTeklifi)$"
    }
    @IBAction func gunesSlider(_ sender: UISlider) {
        kullanici.gunesTeklifi = Int(sender.value)
        gunesLabel.text = "\(kullanici.gunesTeklifi)$"
        
    }
    @IBAction func bioSlider(_ sender: UISlider) {
        kullanici.bioTeklifi = Int(sender.value)
        bioLabel.text = "\(kullanici.bioTeklifi)$"
    }
    
    @IBAction func nukleerSlider(_ sender: UISlider) {
        kullanici.nukleerTeklifi = Int(sender.value)
        nukleerLabel.text = "\(kullanici.nukleerTeklifi) $"
    }
    @IBAction func ruzgarSlider(_ sender: UISlider) {
        kullanici.ruzgarTeklifi = Int(sender.value)
        ruzgarLabel.text = "\(kullanici.ruzgarTeklifi)$"
    }
    
    /// Bu ekran ilk acildigi an tetiklenen methoddur, Oyun ilk acildiginda default degerler atanmalidir
    override func viewDidLoad() {
        super.viewDidLoad()
        sliderGuncelle()
        butceUiGuncelle()
    }
    
    fileprivate func butceUiGuncelle() {
        butceLabel.text = kullanici.butce.format(Currency.USD)
    }
    
    /// Yatirim Ekranindan Enerji Santrali Satin Alindiginda Tetiklenir,
    /// Butcenin olmadigi durumda kullaniciya uyari gider, ancak butce varsa satin alma islemi gerceklesir
    /// Oyun geregi kullanici bir santral aldiginda teklif vermeye baslayabilir
    func satinAlindi(enerjiTuru: YoneticiViewModel.EnerjiTurleri) {
        
        ///Alinmak istenen santralin maliyeti o anki butceden buyukse oyuncuya uyari bildirimi atilir
        if enerjiTuru.satinAlmaMaliyeti > kullanici.butce {
            
            print("Alınmak İstenen Santrale Yeterli Bütçe Yok")
            
            let title = "Alınmak İstenen Santrale Yeterli Bütçe Yok"
            let tamam = UIAlertAction(title: "Tamam", style: .cancel)
            
            let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
            
            alert.addAction(tamam)
            
            self.present(alert, animated: true, completion: nil)
            
            return
        }
        
        if kullanici.yatirimlar.contains(enerjiTuru) {
            Loaf("Bu santral daha önce satın alındı !", state: .info, sender: self).show(.short)
            return
        }
        
        /// Yatirim sonrasi butce ve ui guncellenir
        kullanici.butce -= enerjiTuru.satinAlmaMaliyeti
        butceUiGuncelle()
        
        kullanici.yatirimlar.append(enerjiTuru)
        sliderGuncelle()
        
        Loaf("\(enerjiTuru) santrali satın alındı", state: .info, sender: self).show(.short)
        
        ///Her bir santralin ne zaman satin alindigini belirleyen durum
        switch enerjiTuru {
        case .ruzgar :
            kullanici.ruzgarSatinAlinanPeriyot = YoneticiViewModel.shared.periyot
        case .nukleer :
            kullanici.nukSatinAlinanPeriyot = YoneticiViewModel.shared.periyot
        case .bio :
            kullanici.bioSatinAlinanPeriyot = YoneticiViewModel.shared.periyot
        case .gunes :
            kullanici.gunesSatinAlinanPeriyot = YoneticiViewModel.shared.periyot
        case .komur :
            kullanici.komurSatinAlinanPeriyot = YoneticiViewModel.shared.periyot
        }
    }
    
    
    /// Bu method yatirim yapildiktan sonra her bir enerji santrali icin o santralin sliderinin kullanimini duzenler
    func sliderGuncelle() {
        
        if let nukSatinAlinanPeriyot = kullanici.nukSatinAlinanPeriyot,
           YoneticiViewModel.EnerjiTurleri.nukleer.santralinOmru >= YoneticiViewModel.shared.periyot,
           YoneticiViewModel.EnerjiTurleri.nukleer.santralinAktiflesmeDonemi + nukSatinAlinanPeriyot <= YoneticiViewModel.shared.periyot,
           kullanici.yatirimlar.contains(.nukleer) {
            nukleerSliderOutlet.isUserInteractionEnabled = true
        } else {
            nukleerSliderOutlet.isUserInteractionEnabled = false
        }
        if let ruzgarSatinAlinanPeriyot = kullanici.ruzgarSatinAlinanPeriyot,
           YoneticiViewModel.EnerjiTurleri.ruzgar.santralinOmru >= YoneticiViewModel.shared.periyot,
           YoneticiViewModel.EnerjiTurleri.ruzgar.santralinAktiflesmeDonemi + ruzgarSatinAlinanPeriyot <= YoneticiViewModel.shared.periyot,
           kullanici.yatirimlar.contains(.ruzgar) {
            ruzgarSliderOutlet.isUserInteractionEnabled = true
        } else {
            ruzgarSliderOutlet.isUserInteractionEnabled = false
        }
        
        if let bioSatinAlinanPeriyot = kullanici.bioSatinAlinanPeriyot,
           YoneticiViewModel.EnerjiTurleri.bio.santralinOmru >= YoneticiViewModel.shared.periyot,
           YoneticiViewModel.EnerjiTurleri.bio.santralinAktiflesmeDonemi + bioSatinAlinanPeriyot <= YoneticiViewModel.shared.periyot,
           kullanici.yatirimlar.contains(.bio)
        {
            bioSliderOutlet.isUserInteractionEnabled = true
        } else {
            bioSliderOutlet.isUserInteractionEnabled = false
        }
        
        if let komurSatinAlinanPeriyot = kullanici.komurSatinAlinanPeriyot,
           YoneticiViewModel.EnerjiTurleri.komur.santralinOmru >= YoneticiViewModel.shared.periyot,
           YoneticiViewModel.EnerjiTurleri.komur.santralinAktiflesmeDonemi + komurSatinAlinanPeriyot <= YoneticiViewModel.shared.periyot,
           kullanici.yatirimlar.contains(.komur) {
            komurSliderOutlet.isUserInteractionEnabled = true
        } else {
            komurSliderOutlet.isUserInteractionEnabled = false
        }
        
        if let gunesSatinAlinanPeriyot = kullanici.gunesSatinAlinanPeriyot,
           YoneticiViewModel.EnerjiTurleri.gunes.santralinOmru >= YoneticiViewModel.shared.periyot,
           YoneticiViewModel.EnerjiTurleri.gunes.santralinAktiflesmeDonemi + gunesSatinAlinanPeriyot <= YoneticiViewModel.shared.periyot,
           kullanici.yatirimlar.contains(.gunes)
        {
            gunesSliderOutlet.isUserInteractionEnabled = true
        } else {
            gunesSliderOutlet.isUserInteractionEnabled = false
        }
        
    }
    
    
    
}
