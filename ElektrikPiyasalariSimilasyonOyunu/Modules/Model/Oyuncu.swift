//
//  Oyuncu.swift
//  ElektrikPiyasalariSimilasyonOyunu
//
//  Created by Berat Rıdvan Asiltürk on 9.06.2022.
//

import Foundation
import UIKit
import Format

class Oyuncu: CustomDebugStringConvertible {
    
    var debugDescription: String {
        "İsim: \(isim), Bütçe: \(butce) \n"
    }
    
    private(set) var isim: String
    private(set) var butce: Int
    
    /// Oyuncunun yatirim yaptigi enerji santralleri
    /// Satin alinan santraller bu degiskende tutulur
    private var yatirimlar : [YoneticiViewModel.EnerjiTurleri] = []
    
    init(isim: String, butce: Int) {
        self.isim = isim
        self.butce = butce
    }
    /// Kullanicinin O Periyotta Verdigi Teklif
    /// Her Periyot Sifirlanir
    private var komurTeklifi = 0
    private var gunesTeklifi = 0
    private var ruzgarTeklifi = 0
    private var nukleerTeklifi = 0
    private var bioTeklifi = 0
    
    ///Her bir santral icin default atanan baslangic degerleri
    private var bioSatinAlinanPeriyot: Int?
    private var komurSatinAlinanPeriyot: Int?
    private var nukSatinAlinanPeriyot: Int?
    private var ruzgarSatinAlinanPeriyot: Int?
    private var gunesSatinAlinanPeriyot: Int?
    
    
    /// Kullanicinin her bir periyotta , butcesini hesplar .
    private func kullaniciGelirleriniHesapla() {
        /// Bio Yakit santarlin omru toplam periyottan kucuk esitse ve
        /// Bio Yakit santralin aktiflesme donemi ile satin alinan andaki periyotun oyun geneli toplam periyottan kucuk ve esit olmasi kosulunda ancak kodu calistiran kosul
        if let bioSatinAlinanPeriyot = bioSatinAlinanPeriyot,
           bioTeklifi > YoneticiViewModel.shared.minimumTeklifFiyati(YoneticiViewModel.shared.periyot, enerjiTuru: .bio),
           YoneticiViewModel.EnerjiTurleri.bio.santralinOmru >= YoneticiViewModel.shared.periyot,
           YoneticiViewModel.EnerjiTurleri.gunes.santralinAktiflesmeDonemi + bioSatinAlinanPeriyot <= YoneticiViewModel.shared.periyot {
            butce += YoneticiViewModel.shared.gelir(teklif: bioTeklifi, enerjiTuru: .bio)
            print("👍🏻 Bio Teklifi Kabul Edildi - \(isim) - \(bioTeklifi)")
        }
        /// Gunes santarlin omru toplam periyottan kucuk esitse ve
        /// Gunes santralin aktiflesme donemi ile satin alinan andaki periyotun oyun geneli toplam periyottan kucuk ve esit olmasi kosulunda ancak kodu calistiran kosul
        if let gunesSatinAlinanPeriyot = gunesSatinAlinanPeriyot,
           gunesTeklifi > YoneticiViewModel.shared.minimumTeklifFiyati(YoneticiViewModel.shared.periyot, enerjiTuru: .gunes),
           YoneticiViewModel.EnerjiTurleri.gunes.santralinOmru >= YoneticiViewModel.shared.periyot,
           YoneticiViewModel.EnerjiTurleri.gunes.santralinAktiflesmeDonemi + gunesSatinAlinanPeriyot <= YoneticiViewModel.shared.periyot {
            butce += YoneticiViewModel.shared.gelir(teklif: gunesTeklifi, enerjiTuru: .gunes)
            print("👍🏻  Gunes Teklifi Kabul Edildi - \(isim) - \(bioTeklifi)")
        }
        
        /// Komur santarlin omru toplam periyottan kucuk esitse ve
        /// Komur santralin aktiflesme donemi ile satin alinan andaki periyotun oyun geneli toplam periyottan kucuk ve esit olmasi kosulunda ancak kodu calistiran kosul
        if let komurSatinAlinanPeriyot = komurSatinAlinanPeriyot,
           komurTeklifi > YoneticiViewModel.shared.minimumTeklifFiyati(YoneticiViewModel.shared.periyot, enerjiTuru: .komur),
           YoneticiViewModel.EnerjiTurleri.komur.santralinOmru >= YoneticiViewModel.shared.periyot,
           YoneticiViewModel.EnerjiTurleri.komur.santralinAktiflesmeDonemi + komurSatinAlinanPeriyot <= YoneticiViewModel.shared.periyot {
            butce += YoneticiViewModel.shared.gelir(teklif: komurTeklifi, enerjiTuru: .komur)
            print("👍🏻  Komur Teklifi Kabul Edildi - \(isim) - \(bioTeklifi)")
        }
        /// Nukleer santarlin omru toplam periyottan kucuk esitse ve
        /// Nukleer santralin aktiflesme donemi ile satin alinan andaki periyotun oyun geneli toplam periyottan kucuk ve esit olmasi kosulunda ancak kodu calistiran kosul
        if let nukSatinAlinanPeriyot = nukSatinAlinanPeriyot,
           nukleerTeklifi > YoneticiViewModel.shared.minimumTeklifFiyati(YoneticiViewModel.shared.periyot, enerjiTuru: .nukleer),
           YoneticiViewModel.EnerjiTurleri.nukleer.santralinOmru >= YoneticiViewModel.shared.periyot,
           YoneticiViewModel.EnerjiTurleri.nukleer.santralinAktiflesmeDonemi + nukSatinAlinanPeriyot <= YoneticiViewModel.shared.periyot {
            butce += YoneticiViewModel.shared.gelir(teklif: nukleerTeklifi, enerjiTuru: .nukleer)
            print("👍🏻  Nuk Teklifi Kabul Edildi - \(isim) - \(bioTeklifi)")
        }
        /// Ruzgar santarlin omru toplam periyottan kucuk esitse ve
        /// ruzgar santralin aktiflesme donemi ile satin alinan andaki periyotun oyun geneli toplam periyottan kucuk ve esit olmasi kosulunda ancak kodu calistiran kosul
        if let ruzgarSatinAlinanPeriyot = ruzgarSatinAlinanPeriyot,
           ruzgarTeklifi > YoneticiViewModel.shared.minimumTeklifFiyati(YoneticiViewModel.shared.periyot, enerjiTuru: .ruzgar),
           YoneticiViewModel.EnerjiTurleri.ruzgar.santralinOmru >= YoneticiViewModel.shared.periyot,
           YoneticiViewModel.EnerjiTurleri.ruzgar.santralinAktiflesmeDonemi + ruzgarSatinAlinanPeriyot <= YoneticiViewModel.shared.periyot {
            
            butce += YoneticiViewModel.shared.gelir(teklif: ruzgarTeklifi, enerjiTuru: .ruzgar)
            print("👍🏻  Ruzgar Teklifi Kabul Edildi - \(isim) - \(bioTeklifi)")
        }
    }
    
    /// Butcenin yeterli olmasi durumunda satin almayi dener
    private func santralSatinAl() {
        guard let alinacakSantral = YoneticiViewModel.shared.santraller.randomElement() else {
            return
        }
        
        
        // zaten satin alinan santral tekrar alinamaz
        if yatirimlar.contains(alinacakSantral) {
            return
        }
        
        // butce yeterli degilse santral alinamaz
        if butce < alinacakSantral.satinAlmaMaliyeti {
            return
        }
        
        // butce yeterliyse santral alinir, yatirimlara eklenir, maliyeti dusurulur.
        butce -= alinacakSantral.satinAlmaMaliyeti
        yatirimlar.append(alinacakSantral)
        
        
        if alinacakSantral == YoneticiViewModel.EnerjiTurleri.komur {
            komurSatinAlinanPeriyot = YoneticiViewModel.shared.periyot
        }
        if alinacakSantral == YoneticiViewModel.EnerjiTurleri.gunes {
            gunesSatinAlinanPeriyot = YoneticiViewModel.shared.periyot
        }
        if alinacakSantral == YoneticiViewModel.EnerjiTurleri.ruzgar {
            ruzgarSatinAlinanPeriyot = YoneticiViewModel.shared.periyot
        }
        if alinacakSantral == YoneticiViewModel.EnerjiTurleri.bio {
            bioSatinAlinanPeriyot = YoneticiViewModel.shared.periyot
        }
        if alinacakSantral == YoneticiViewModel.EnerjiTurleri.nukleer {
            nukSatinAlinanPeriyot = YoneticiViewModel.shared.periyot
        }
        
        
    }
    
    /// Piyasa teklifi verir
    private func teklifVer() {
        for yatirim in yatirimlar {
            let teklif = (0...200).randomElement()!
            
            if yatirim == YoneticiViewModel.EnerjiTurleri.komur {
                komurTeklifi = teklif
            }
            if yatirim == YoneticiViewModel.EnerjiTurleri.gunes {
                gunesTeklifi = teklif
            }
            if yatirim == YoneticiViewModel.EnerjiTurleri.ruzgar {
                ruzgarTeklifi = teklif
            }
            if yatirim == YoneticiViewModel.EnerjiTurleri.bio {
                bioTeklifi = teklif
            }
            if yatirim == YoneticiViewModel.EnerjiTurleri.nukleer {
                nukleerTeklifi = teklif
            }
            
            
        }
    }
    
    /// Ana oyunda her bir periyot artiminda, onayla butonu tiklandiginda tetiklenir.
    func teklifiOnayla() {
        santralSatinAl()
        teklifVer()
        kullaniciGelirleriniHesapla()
        
        print(" **** **** **** ")
        print(" OYUNCU ")
        print(" \(isim) ")
        print(" BUTCE ")
        print(butce.format(Currency.USD))
        print(" YATIRIMLARI ")
        print(" \(yatirimlar) ")
        
        print("")
        print(" **** **** **** ")
        
    }
    
}
