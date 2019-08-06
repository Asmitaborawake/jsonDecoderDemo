//
//  DetailsViewController.swift
//  JsonCoderDemo
//
//  Created by Asmita Borawake on 06/08/19.
//  Copyright © 2019 Asmita Borawake. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var alpha2: UILabel!
    
    @IBOutlet weak var alpha3: UILabel!
    
    @IBOutlet weak var subresign: UILabel!
    
    @IBOutlet weak var resign: UILabel!
    
    var alpha2str  =  ""
    var alpha3str  =  ""
    var subresignstr  =  ""
    var resignstr  =  ""
    override func viewDidLoad() {
        super.viewDidLoad()

       resign.text = resignstr
        subresign.text = subresignstr
        alpha2.text = alpha2str
        alpha3.text = alpha3str
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
