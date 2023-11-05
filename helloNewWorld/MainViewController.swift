//
//  ViewController.swift
//  helloNewWorld
//
//  Created by Zalman Zoteev on 01/11/2023.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet var redLabel: UIView!
    @IBOutlet var yellowLabel: UIView!
    @IBOutlet var greenLabel: UIView!
    @IBOutlet var timerLabel: UILabel!
    
    enum Light {
        case red, yellow, green }
    
    private var statusColor = Light.red
    private var timer: Timer?
    var seconds = 10
    private var targetValue = 0
    private var countOfTouches = 0
    private var yForButton = (1...700).randomElement()!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
           
        
        createButton()

        redLabel.alpha = 0.3
        yellowLabel.alpha = 0.3
        greenLabel.alpha = 0.3
        
    }
    
    override func viewWillLayoutSubviews() {
        redLabel.layer.cornerRadius = redLabel.frame.height / 2
        yellowLabel.layer.cornerRadius = yellowLabel.frame.width / 2
        greenLabel.layer.cornerRadius = greenLabel.frame.height / 2
    }

    @objc func updateTimer() {
            seconds -= 1
            print("Прошло \(seconds) секунд")
        timerLabel.text = "Прошло \(seconds) секунд"
        if seconds <= targetValue {
                    print("Достигнуто значение \(targetValue). Остановка таймера.")
                    createAlert()
                    timer?.invalidate()
                }
        }
    
    deinit {
                timer?.invalidate()
            }
    
    
    func createButton() {
        let button = UIButton(type: .system)
                button.backgroundColor = UIColor.blue
                button.setTitle("Run", for: .normal)
                button.setTitleColor(UIColor.white, for: .normal)
                button.layer.cornerRadius = 10
                button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
                button.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
                button.frame = CGRect(x: view.frame.width / 2 - 60, y: 750, width: 120, height: 50)
                view.addSubview(button)
    }
    
    func createAlert() {
        let alertController = UIAlertController(title: "game over", message: "Ты успел нажать \(countOfTouches) раз", preferredStyle: .alert)

               let okAction = UIAlertAction(title: "New game", style: .default) { (action) in
                   self.dismiss(animated: true, completion: nil)
                   print("Кнопка OK была нажата")
               }
               alertController.addAction(okAction)

               present(alertController, animated: true, completion: nil)
           
    }
    
    

    @IBAction func buttonAction(_ sender: UIButton) {
        countOfTouches += 1
        
        switch statusColor {
        case .red:
            redLabel.alpha = 1
            yellowLabel.alpha = 0.3
            greenLabel.alpha = 0.3
            statusColor = .yellow
            sender.frame = CGRect(x: (1...200).randomElement()!,
                                  y: (1...700).randomElement()!,
                                  width: (40...160).randomElement()!,
                                  height: (30...100).randomElement()!
                                )
            sender.setTitle("\(countOfTouches)", for: .normal)
            sender.setTitleColor(.red, for: .normal)
            
        case .yellow:
            redLabel.alpha = 0.3
            yellowLabel.alpha = 1
            greenLabel.alpha = 0.3
            statusColor = .green
            sender.frame = CGRect(x: (1...200).randomElement()!,
                                  y: (1...700).randomElement()!,
                                  width: (40...160).randomElement()!,
                                  height: (30...100).randomElement()!
                                )
            sender.setTitle("\(countOfTouches)", for: .normal)
            sender.setTitleColor(.systemYellow, for: .normal)
            
        case .green:
            redLabel.alpha = 0.3
            yellowLabel.alpha = 0.3
            greenLabel.alpha = 1
            statusColor = .red
            sender.frame = CGRect(x: (1...200).randomElement()!,
                                  y: (1...700).randomElement()!,
                                  width: (40...160).randomElement()!,
                                  height: (30...100).randomElement()!
                                )
            sender.setTitle("\(countOfTouches)", for: .normal)
            sender.setTitleColor(.systemGreen, for: .normal)
        }
    }
}

