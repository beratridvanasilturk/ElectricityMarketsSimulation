//
//  SiralamaTableViewController.swift
//  ElektrikPiyasalariSimilasyonOyunu
//
//  Created by Berat Rıdvan Asiltürk on 9.06.2022.
//

import UIKit
import Format

class SiralamaTableViewController: UITableViewController {
    
    var siralama = YoneticiViewModel.shared.butceyeGoreSiralananOyuncular

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return siralama.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "siralamaCell", for: indexPath)
        
        let oyuncu = siralama[indexPath.row]
        
        let oyuncuLabel = cell.viewWithTag(1001) as? UILabel
        let butceLabel = cell.viewWithTag(1002) as? UILabel
        let siralamaLabel = cell.viewWithTag(1003) as? UILabel
        let arkaPlan = cell.viewWithTag(1004)
        
        oyuncuLabel?.text = oyuncu.isim
        butceLabel?.text = oyuncu.butce.format(Currency.USD)
        siralamaLabel?.text = "\(indexPath.row + 1)"
        
        if oyuncu.kullanici {
            arkaPlan?.isHidden = false
        } else {
            arkaPlan?.isHidden = true
        }
        
        return cell
    }
    


}
