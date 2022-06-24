//
//  YoneticiViewModel.swift
//  ElektrikPiyasalariSimilasyonOyunu
//
//  Created by Berat Rıdvan Asiltürk on 17.05.2022.
//

import Foundation

/// uygulamada ekranlar arasinda kullanici verilerini yoneten sinif
class YoneticiViewModel {
    
    var periyot = 1
    let baslangicButcesi = 2_000_000_000
    
    var santraller: [EnerjiTurleri] {[
        YoneticiViewModel.EnerjiTurleri.gunes,
        YoneticiViewModel.EnerjiTurleri.ruzgar,
        YoneticiViewModel.EnerjiTurleri.bio,
        YoneticiViewModel.EnerjiTurleri.komur,
        YoneticiViewModel.EnerjiTurleri.nukleer,
    ]}
    
    /// Oyunda yer alacak oyuncular dizisidir
    var oyuncular = [Oyuncu]()
    
    
    /// Oyun sona erdiginde kullanilacak olan , butceye gore siralanan dizi
    var butceyeGoreSiralananOyuncular : [Oyuncu] {
        oyuncular.sorted { i, j in
            i.butce > j.butce
        }
    }
    
    /// Oyunda var olan enerji santralleri
    enum EnerjiTurleri {
        
        case nukleer
        case ruzgar
        case gunes
        case komur
        case bio
        
        
        /// Her bir santralin sahip oldugu MW degeri
        var megawatt : Int {
            switch self {
            case .nukleer:
                return 900
            case .ruzgar:
                return 80
            case .gunes:
                return 60
            case .komur:
                return 600
            case .bio:
                return 800
            }
        }
        
        
        /// Her bir santralin maliyeti
        var satinAlmaMaliyeti : Int {
            switch self {
            case .nukleer:
               return 2_200_000_000
            case .ruzgar:
               return 500_000_000
            case .gunes:
                return 450_000_000
            case .komur:
                return 950_000_000
            case .bio:
                return 1_000_000_000
            }
        }
        /// Her bir santralin kullnaim omru
        var santralinOmru : Int {
            
            switch self {
            case .nukleer:
                return 10
            case .ruzgar:
                return 4
            case .gunes:
                return 5
            case .komur:
                return 6
            case .bio:
                return 10
            }
        }
        
        /// Her bir santralin aktif olacagi donem
        var santralinAktiflesmeDonemi : Int {
            switch self {
            case .nukleer:
                return 2
            case .ruzgar:
                return 1
            case .gunes:
                return 1
            case .komur:
                return 1
            case .bio:
                return 2
            }
        }
    }
    ///Nükleer Santralin Aktif Olması İçin Geçmesi Gereken Dönem: 2
    ///Rüzgar Santralin Aktif Olması İçin Geçmesi Gereken Dönem: 1
    ///Güneş Santralin Aktif Olması İçin Geçmesi Gereken Dönem: 1
    ///Kömür Santralin Aktif Olması İçin Geçmesi Gereken Dönem: 1
    ///Bio-Enerji Santralin Aktif Olması İçin Geçmesi Gereken Dönem: 2
    ///
    ///Nükleer Santralin Kullanım Ömrü: 10
    ///Rüzgar  Santralin Kullanım Ömrü: 4
    ///Güneş  Santralin Kullanım Ömrü: 5
    ///Kömür  Santralin Kullanım Ömrü: 6
    ///Bio-Enerji  Santralin Kullanım Ömrü: 10
    ///
    ///
    
    let yildakiSaat = 8766
    
    /// Kullaniciya donen o turdaki gelir hesabi
    /// - Parameters:
    ///   - teklif: kullanicinin verdigi teklif
    ///   - enerjiTuru: kullanicinin teklif verdigi santral turu
    /// - Returns: Kullaniciya hesaplanan gelir doner
    func gelir(teklif: Int, enerjiTuru: EnerjiTurleri) -> Int {
        return teklif * enerjiTuru.megawatt * yildakiSaat
    }
    
    
    /// Mevcut periyot icin sistemin her bir enerji turune dondugu fiyat
    ///        // piyasa arz talep dengelemesi ve kabul edilen teklifin belirlenmesi.
    func minimumTeklifFiyati(_ periyot: Int, enerjiTuru: EnerjiTurleri) -> Int {
        
        guard periyot > 2 else {
            return 0
        }
        
        let fiyat = (0...300).randomElement()!
        return fiyat
    }
    
    
    /// viewcontroller siniflari arasinda paylasilan obje
    static let shared = YoneticiViewModel()
    
    
    var kullaniciIsmi : String!
    
    
    /// Sistemin sahip oldugu 100 kullanici ismi
    let oyuncuIsimleri :  [String] = [
        
        "Sezgin Eken",
        "Hasan Akkoyun",
        "Zeynep Kocatürk",
        "Akar Dumanlı",
        "Ergül Fırat",
        "Arzu Akaydın",
        "Turhan Gül",
        "Mehmet Sakarya",
        "Rümeysa Meleknur Şener",
        "Kasım Kısakürek",
        "Mahsun Zorlu",
        "Abdullah Çamurcuoğlu",
        "Nil Zengin",
        "Tarkan Demirel",
        "Yaman Akdeniz",
        "Sami Gül",
        "Mete Akar",
        "Ülkü İnönü Alemdar",
        "Sezen Fırat",
        "Cemal Yaman",
        "Hande Aslan",
        "Çelem Zorlu",
        "Göktürk Sakarya",
        "Samet Küpeli",
        "Berra Pınar Gamzeli",
        "Mehmet Yasin Özdemir",
        "Sümeyra Sezgin",
        "Kayra Demir",
        "Tümer Yorulmaz",
        "Arısoy Fırat",
        "Seven Şensoy",
        "Elvan Demirel",
        "Şener Alemdar",
        "Asım Çorlu Türk",
        "Halide Türk",
        "Özgenur Kılıkırk",
        "Tümer Akçay",
        "Sümerya Durmuş Çorlu",
        "Berlin Turan Kaya",
        "Şensoy Durdu",
        "Ülkü Naz Gül",
        "Haliye Duran",
        "Vuslat Yasemin Şensoy",
        "Bahar Tarhan",
        "Yıldırım Güçlü",
        "Taner Kemal Seven",
        "İçim Soylu",
        "Ülker Şensoy",
        "Karakucak Bilir",
        "Pınar Damla Demirel",
        "Leman Hançer Akça",
        "Binışık Akdeniz",
        "Işıl Deviner",
        "Selda Şener",
        "Ferdi Yaman",
        "Tuğtaş Sezer",
        "Şuayp Şensoy",
        "Günser Durdu",
        "Vildane Mansız",
        "Mehrigül Bilge",
        "Asım Sezgin",
        "Dağıstan Çorlu",
        "Barışcan Şener",
        "Arslan Şensoy",
        "Betül Yaman",
        "Ekber Yağın Akçay",
        "Gamze Demir",
        "Çağla Irmak",
        "Emel Kısakürek",
        "Akçay Yaman",
        "Sencar Ertaş",
        "Canan Tevetoğlu",
        "Günver Hançer",
        "Dincer Arsoy",
        "Övün Durmuş",
        "Emirşan Yıldırım",
        "Maksur Duran",
        "Bahaddin Demirel",
        "Ülküdeş Yüksel",
        "Korkmazalp Hasan Ay",
        "Gündüzalp Ertaş Kama",
        "Bahar Akçay",
        "Mecit Sakarya Yılmaz",
        "Yaman Şener",
        "Server Hayrioğlu",
        "Halenur Yorulmaz",
        "Neval Durdu",
        "Esen Korutürk",
        "Kaya İhsanoğlu",
        "Aslan Kemer",
        "Akçay Yaman",
        "Senanur Doğan",
        "Nazimet Gül",
        "Naide Gülen Şensoy",
        "Ülker Çetin",
        "Fırat Ertaş",
        "Leyla Gül",
        "Gül İhsanoğlu",
        "Hançer Duran",
        "Fazıl Akar"
    ]
    
    
    /// Ana oyuncu haric 14 kisiyi random secen degisken
    func oyunculariOlustur() {
        var secilenOyuncular = oyuncuIsimleri.shuffled().prefix(14).map { isim in
            Oyuncu(isim: isim, butce: baslangicButcesi)
        }
        
        secilenOyuncular.append(kullanici)
        
        oyuncular = secilenOyuncular
    }
    
    /// uygulamaya kayit olup kullanan asil oyuncu
    lazy var kullanici: Oyuncu = {
        Oyuncu(isim: kullaniciIsmi, butce: baslangicButcesi, kullanici: true)
    }()
}
