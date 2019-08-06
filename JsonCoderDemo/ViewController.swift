//
//  ViewController.swift
//  JsonCoderDemo
//
//  Created by Asmita Borawake on 06/08/19.
//  Copyright © 2019 Asmita Borawake. All rights reserved.
//

import UIKit


struct  jsonstruct : Decodable{
    let name : String
    let capital : String
    let alpha3Code: String
    let region: String
    let subregion: String
    let alpha2Code: String
    
    
}
class ViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    var arrData = [jsonstruct]()
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    
    
func getData() {
        let url = URL(string: "http://restcountries.eu/rest/v2/all")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            do {
                if error == nil {
                    self.arrData = try JSONDecoder().decode([jsonstruct].self, from: data!)
                    
                   // for data in self.arrData{
                        //print(data.name, ";" ,data.capital, ";" ,data.alpha3Code)
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                        
                   // }
                }
                
            }catch{
                print("error in get json data")
            }
            
            
            }.resume()
        
    }
}



extension ViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.nameLbl.text = arrData[indexPath.row].name
        cell.capitalLbl.text = arrData[indexPath.row].capital
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detail:DetailsViewController = self.storyboard?.instantiateViewController(withIdentifier: "DetailsViewController")  as!  DetailsViewController
        
        detail.resignstr  = "Resign :  \(arrData[indexPath.row].region)"
        detail.subresignstr = "SubResign :  \(arrData[indexPath.row].subregion)"
        detail.alpha2str = "Alpha2Code :  \(arrData[indexPath.row].alpha2Code)"
        detail.alpha3str = "Alpha3Code :  \(arrData[indexPath.row].alpha3Code)"
        self.navigationController?.pushViewController(detail, animated: true)
    }
    
    
}
