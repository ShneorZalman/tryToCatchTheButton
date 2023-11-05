//
//  StartViewController.swift
//  helloNewWorld
//
//  Created by Zalman Zoteev on 03/11/2023.
//

import UIKit

class StartViewController: UIViewController {

    @IBOutlet var timerTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "nextScreen" {
            if let destinationVC = segue.destination as? MainViewController {
                destinationVC.seconds = Int(timerTextField.text!)!
            }
        }
    }

}
