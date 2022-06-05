//
//  OyuncularTablosuViewController.swift
//  ElektrikPiyasalariSimilasyonOyunu
//
//  Created by Berat Rıdvan Asiltürk on 22.05.2022.
//

import UIKit


/// Oyuncu Table View Ekran Sinifi
class OyuncularTablosuViewController : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    /// Random secilen oyuncular sayisi kadar ekranda satir olusturur
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return YoneticiViewModel.shared.secilenOyuncularGetir.count
    }
    
    
    /// Olusturulan her bir satir icin kullanici getirir
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
 
        let cell = tableView.dequeueReusableCell(withIdentifier: "OyuncularHucresi", for: indexPath)
        cell.textLabel?.text = YoneticiViewModel.shared.secilenOyuncularGetir[indexPath.row]
        return cell
    }
    
    
    
    /// tableview listelemede kullanilan degisken
    @IBOutlet weak var tableView: UITableView!
    
    /// Bu ekran ilk acildigi an tetiklenen methoddur
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Satirlari olusturmak icin gerekli altyapiyi saglar
        tableView.delegate = self
        tableView.dataSource = self
    
    }
}
