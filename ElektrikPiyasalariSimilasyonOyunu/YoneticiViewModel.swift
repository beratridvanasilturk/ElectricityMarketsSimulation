//
//  YoneticiViewModel.swift
//  ElektrikPiyasalariSimilasyonOyunu
//
//  Created by Berat Rıdvan Asiltürk on 17.05.2022.
//

import Foundation

    /// uygulama icerisinde saklanacak sinif
class YoneticiViewModel {
    
    
   
    enum EnerjiTurleri {
        
        case nukleer
        case ruzgar
        case gunes
        case komur
        case bio
        
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
                return 300
            }
        }
        
        var satinAlmaMaaliyeti : Int {
            switch self {
            case .nukleer:
               return 800_000_000
            case .ruzgar:
               return 70_000_000
            case .gunes:
                return 60_000_000
            case .komur:
                return 170_000_000
            case .bio:
                return 100_000_000
            }
        }
        
    }
    
  
    let yildakiSaat = 8766
    
   
    
    func gelir(teklif: Int, enerjiTuru: EnerjiTurleri) -> Int {
        return teklif * enerjiTuru.megawatt * yildakiSaat
    }
    
    func minimumTeklifFiyati(enerjiTuru: EnerjiTurleri) -> Int {
        
        (70...130).randomElement() ?? 90
    }
    
    
    /// viewcontroller siniflari arasinda paylasilacak obje
    ///
    static let shared = YoneticiViewModel()
    
    var kullaniciIsmi : String!
    
    let oyuncular :  [String] = [
        
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
        "Oğuzhan Yaman",
        "Feyza Yıldırım",
        "Erdoğan Akçay",
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
        "Ünal Mansız",
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
    
    lazy var secilenOyuncularGetir : [String] = {
        var secilenOyuncular = oyuncular.shuffled().prefix(9).map { $0 }
        
        secilenOyuncular.insert(kullaniciIsmi, at: 0)
        
        return secilenOyuncular
        
    }()
    
    
}
