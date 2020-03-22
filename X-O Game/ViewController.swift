//
//  ViewController.swift
//  X-O Game
//
//  Created by saad on 3/17/20.
//  Copyright © 2020 X-O Game. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Button Start Outlet
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var b4: UIButton!
    @IBOutlet weak var b5: UIButton!
    @IBOutlet weak var b6: UIButton!
    @IBOutlet weak var b7: UIButton!
    @IBOutlet weak var b8: UIButton!
    @IBOutlet weak var b9: UIButton!
    // End

    // Label Start
       //X
   
    @IBOutlet weak var L0: UILabel!
    @IBOutlet weak var Ll: UILabel!
    @IBOutlet weak var Or: UILabel!
    @IBOutlet weak var Xr: UILabel!

    
    
    
    @IBOutlet weak var TurnLabel: UILabel!
    @IBOutlet weak var DarkModeLabel: UILabel!
    @IBOutlet weak var XOLabel: UILabel!
    // End
    
  //  Var And Let
    var counter = 0
    var Xwins : Int = 0
    var Owins : Int = 0
    let generator = UINotificationFeedbackGenerator()


 // End
    
    @IBAction func Switch(_ sender: UISwitch) {
        
        if sender.isOn == true {
            self.view.backgroundColor = UIColor.black
            TurnLabel.textColor = UIColor.white
            DarkModeLabel.textColor = UIColor.white
            sender.onTintColor = UIColor.white
            sender.thumbTintColor = UIColor.black
            XOLabel.textColor = UIColor.white
            DarkModeLabel.text = "Dark Mode On"

        }
        else {
            self.view.backgroundColor = UIColor.white
            TurnLabel.textColor = UIColor.black
            DarkModeLabel.textColor = UIColor.black
            sender.onTintColor = UIColor.black
            sender.thumbTintColor = UIColor.white
            XOLabel.text = "X-O GAME"
            XOLabel.textColor = UIColor.black
            DarkModeLabel.text = "Dark Mode off"

        }
    }
    @IBAction func ResetButton(_ sender: Any) {
        RestartGame()
    }
    
    
    
    
    @IBAction func PressButton(_ sender: UIButton) {

        if counter % 2 == 0 {
            sender.setTitle("X", for: .normal)
            sender.setTitleColor(#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1), for: .normal)
           // TurnLabel.text = "Turn O"
        } else {
            sender.setTitle("O", for: .normal)
            sender.setTitleColor(.red, for: .normal)
           // TurnLabel.text = "Turn X"
        }
        
        

        
        counter+=1
        
        sender.isEnabled = false

        wining(winner: "X")
        wining(winner: "O")
        print(counter)
        
       


        
    }
    
    func wining(winner: String) {
        if (b1.titleLabel?.text == winner && b2.titleLabel?.text == winner &&
         b3.titleLabel?.text == winner) || (b1.titleLabel?.text == winner &&
         b4.titleLabel?.text == winner && b7.titleLabel?.text == winner) ||
        (b2.titleLabel?.text == winner && b5.titleLabel?.text == winner &&
         b8.titleLabel?.text == winner) || (b3.titleLabel?.text == winner &&
         b6.titleLabel?.text == winner && b9.titleLabel?.text == winner) || (b1.titleLabel?.text == winner && b5.titleLabel?.text == winner && b9.titleLabel?.text == winner) || (b3.titleLabel?.text == winner &&
         b5.titleLabel?.text == winner && b7.titleLabel?.text == winner)
        
        {
            
       generator.notificationOccurred(.success)

            print("Winner is \(winner)")
            Alert(winner: "\(winner)")
            
            if winner == "X" {
                
                Xwins+=1
                print("X is Win")
                print(Xwins)
            }
        }

        
        
    }
    

    
    func RestartGame() {
        counter = 0
        b1.setTitle("", for: .normal)
        b1.isEnabled = true
        
        b2.setTitle("", for: .normal)
        b2.isEnabled = true
        
        b3.setTitle("", for: .normal)
        b3.isEnabled = true
        
        b4.setTitle("", for: .normal)
        b4.isEnabled = true
        
        b5.setTitle(" ", for: .normal)
        b5.isEnabled = true
        
        b6.setTitle("", for: .normal)
        b6.isEnabled = true
        
        b7.setTitle("", for: .normal)
        b7.isEnabled = true
        
        b8.setTitle("", for: .normal)
        b8.isEnabled = true
        
        b9.setTitle("", for: .normal)
        b9.isEnabled = true
 
        b1.titleLabel?.text = ""
        b2.titleLabel?.text = ""
        b3.titleLabel?.text = ""
        b4.titleLabel?.text = ""
        b5.titleLabel?.text = ""
        b6.titleLabel?.text = ""
        b7.titleLabel?.text = ""
        b8.titleLabel?.text = ""
        b9.titleLabel?.text = ""

        
        
        
        counter = 0
    }
    
    
    func Alert(winner: String) {
        
        let AlerController = UIAlertController(title: "فاز \(winner)", message: "قم بالضغط على اعادة اللعب لاعادة اللعب", preferredStyle: .alert)
        let resetAction = UIAlertAction(title: "اعادة اللعب", style: .default, handler:       {(action: UIAlertAction!) in
            self.RestartGame()
            }
        )
        AlerController.addAction(resetAction)
        present(AlerController, animated: true , completion: nil)
    }
    

    override func viewDidLoad() {
        
        counter = 0
        super.viewDidLoad()
        
        
        
        // Do any additional setup after loading the view.
    }


}

