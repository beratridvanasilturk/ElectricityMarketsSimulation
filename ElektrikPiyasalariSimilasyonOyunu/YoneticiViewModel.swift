//
//  YoneticiViewModel.swift
//  ElektrikPiyasalariSimilasyonOyunu
//
//  Created by Berat Rıdvan Asiltürk on 22.05.2022.
//

import Foundation

    /// uygulama icerisinde saklanacak sinif
class YoneticiViewModel {
    
    /// viewcontroller siniflari arasinda paylasilacak obje
    ///
    static let shared = YoneticiViewModel()
    
    var kullaniciIsmi : String?
    
    let oyuncular :  [String] = [
        
        "Filit Tanyolaç Sezgin",
        "Şayan İnönü",
        "Bilay Zeyno Türk",
        "Mufide Havse Akar Dumanlı",
        "Bayan Mümtaze Zöhrehan Ergül Fırat",
        "Aru Aydınbey Seven Şensoy",
        "Bayan Kefser Gülbani Tarhan Gül",
        "Mehmetzahir Sakarya",
        "Dr. Rümeysa Meleknur Akça Şener",
        "Basım Kısakürek",
        "Mahsun Zorlu",
        "Dr. Bozbağ Abdülhadi Çamurcuoğlu",
        "Dr. Nili Mümtaze Şama Zengin",
        "Fuzuli Ünlen Tarhan Demirel",
        "Dr. Besey Akdeniz Zorlu",
        "Samurtay Gül",
        "Kete Akar",
        "Bayan Sirap Beyhatun İnönü Alemdar",
        "Sezen Meyhanim Fırat",
        "Abdiş Yaman",
        "Özokçu Aslan",
        "Atatöre Çelem Zorlu",
        "Gök Zilfa Sakarya",
        "Oğuzman Yaman",
        "Feyha Yıldırım",
        "Yahşi Şazime Erdoğan Akçay",
        "Sümerya Sezgin",
        "Kayrabay Demir",
        "Feraye Yorulmaz",
        "Arısoy Idık Fırat",
        "Leyli Seven Şensoy",
        "Dr. Begim Elvan Demirel",
        "Dr. Rayla Dilsitan Şener Alemdar",
        "Koçkan Asım Çorlu Türk",
        "Halidun Türk",
        "Asu Natalia Tevetoğlu Zorlu",
        "Tümer Akçay",
        "Sümerya Gülhisar Durmuş Çorlu",
        "Bay Zoral Önel Mansız",
        "Acar Sezginbaş Şensoy Durdu",
        "Ensari Gül",
        "Haliye Arsoy Duran",
        "Dr. Aygutalp Yetişal Erdoğan",
        "Buhari Tarhan",
        "Sevla Yahşi Yıldırım Güçlü",
        "Sevindik Seven",
        "İçimbike Soylu",
        "Fetullah Sudi Ülker Şensoy",
        "Bay Karakucak Bilir",
        "Hayrünnisa Demirel",
        "Bayan Limon Hançer Akça",
        "Binışık Akdeniz",
        "Işıman Deviner Tevetoğlu",
        "Naz Sejda Şener",
        "Edgübay Yaman",
        "Tuğtaş Sezer",
        "Bay Şuayp Şensoy",
        "Bay Günser Durdu",
        "Vildane Mansız",
        "Mehrigül Bilge",
        "Akatay Asım Sezgin",
        "Dağistan Çorlu",
        "Barışcan Şener",
        "Aran Beyler Arslan Şensoy",
        "Bitül Yaman",
        "Dr. Ekber Yağın Akçay",
        "Dr. Gönen Almus Demir",
        "Çakar Soylu",
        "Zülbiye Emal Kısakürek",
        "Başok Cangür Akçay Yaman",
        "Dr. Onat Sencar Ertaş",
        "Canan Tevetoğlu",
        "Günver Altınçiçek Hançer",
        "Bay Kayıt Dincer Arsoy",
        "Övün Durmuş",
        "Emirşan Yıldırım",
        "Dr. Maksur Çamok Duran",
        "Bay Bahaddin Demirel",
        "Ülküdeş Yüksel",
        "Bay Korkmazalp Yasan Şama",
        "Saydam Gündüzalp Ertaş Şama",
        "İlkbahar Akçay",
        "Basım Mecit Sakarya Yılmaz",
        "İlteriş Şuayp Yaman Şener",
        "Bellisan Server Hayrioğlu",
        "Halenur Hançer Yorulmaz",
        "Neval Durdu",
        "Esenbay Korutürk",
        "Kayagün İhsanoğlu",
        "Fatigül Aslan İnönü",
        "Birgit Ğanim Akçay Yaman",
        "Dr. Sernur Nursim Erdoğan",
        "Nazimet Gül",
        "Bayan Naide Alabezek Gülen Şensoy",
        "Gülenay Asiman Ülker Çetin",
        "Kutun Ertaş",
        "Leyli Gül",
        "Bayan Nuriyet Gül İhsanoğlu",
        "Dr. Divan Lüfen Hançer Duran",
        "Fazul Güçal Manço Akar"
    ]
    
    lazy var randomOyuncularGetir : [String] = {
        return oyuncular.shuffled().prefix(10).map { $0 }
    }()
    
}
