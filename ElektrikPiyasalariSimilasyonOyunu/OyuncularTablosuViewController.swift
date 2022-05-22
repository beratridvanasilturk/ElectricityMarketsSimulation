//
//  OyuncularTablosuViewController.swift
//  ElektrikPiyasalariSimilasyonOyunu
//
//  Created by Berat Rıdvan Asiltürk on 22.05.2022.
//

import UIKit



class OyuncularTablosuViewController : UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    var oyuncular = YoneticiViewModel.shared.randomOyuncularGetir
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return YoneticiViewModel.shared.randomOyuncularGetir.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
 
        let cell = tableView.dequeueReusableCell(withIdentifier: "OyuncularHucresi", for: indexPath)
        cell.textLabel?.text = oyuncular[indexPath.row]
        return cell
    }
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        oyuncular.insert(YoneticiViewModel.shared.kullaniciIsmi!, at: 0)
    }
}
