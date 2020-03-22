//
//  ViewController2.swift
//  X-O Game
//
//  Created by saad on 3/17/20.
//  Copyright © 2020 X-O Game. All rights reserved.
//
import UIKit
class ViewController2: UIViewController  {


@IBOutlet weak var b1: UIButton!
@IBOutlet weak var b2: UIButton!
@IBOutlet weak var b3: UIButton!
@IBOutlet weak var b4: UIButton!
@IBOutlet weak var b5: UIButton!
@IBOutlet weak var b6: UIButton!
@IBOutlet weak var b7: UIButton!
@IBOutlet weak var b8: UIButton!
@IBOutlet weak var b9: UIButton!


    
//    @IBAction func Switch(_ sender: UISwitch) {
//        
//        if sender.isOn == true {
//            self.view.backgroundColor = UIColor.black
//         //   TurnLabel.textColor = UIColor.white
//         //   DarkModeLabel.textColor = UIColor.white
//            sender.onTintColor = UIColor.white
//            sender.thumbTintColor = UIColor.black
//            //XOLabel.textColor = UIColor.white
//           // DarkModeLabel.text = "Dark Mode On"
//
//        }
//        else {
//            self.view.backgroundColor = UIColor.white
//           // DarkModeLabel.textColor = UIColor.black
//            sender.onTintColor = UIColor.black
//            sender.thumbTintColor = UIColor.white
//
//        }
//    }
    
    
    
    
    
    
    var turn = 0
       
       
       func endGame(_ winner:String)
       {
           b1.isEnabled = false
           b2.isEnabled = false
           b3.isEnabled = false
           b4.isEnabled = false
           b5.isEnabled = false
           b6.isEnabled = false
           b7.isEnabled = false
           b8.isEnabled = false
           b9.isEnabled = false
           
           showAlertViewForWinning(winner)
       }
       
       func X_check_winning() -> Bool
       {
           let t1 = b1.titleLabel?.text
           let t2 = b2.titleLabel?.text
           let t3 = b3.titleLabel?.text
           let t4 = b4.titleLabel?.text
           let t5 = b5.titleLabel?.text
           let t6 = b6.titleLabel?.text
           let t7 = b7.titleLabel?.text
           let t8 = b8.titleLabel?.text
           let t9 = b9.titleLabel?.text
           
           
           
           let x_win_1 = t1 == "X" && t2 == "X" && t3 == "X"
           let x_win_2 = t4 == "X" && t5 == "X" && t6 == "X"
           let x_win_3 = t7 == "X" && t8 == "X" && t9 == "X"
           let x_win_4 = t1 == "X" && t4 == "X" && t7 == "X"
           let x_win_5 = t2 == "X" && t5 == "X" && t8 == "X"
           let x_win_6 = t3 == "X" && t6 == "X" && t9 == "X"
           let x_win_7 = t1 == "X" && t5 == "X" && t9 == "X"
           let x_win_8 = t3 == "X" && t5 == "X" && t7 == "X"
           
           
           if x_win_1 || x_win_2 || x_win_3 || x_win_4 || x_win_5 || x_win_6 || x_win_7 || x_win_8
           {
               print("X wins!")
               endGame("X")
               return true
           }
           return false
       }
       
       func o_check_winning() -> Bool
       {
           let t1 = b1.titleLabel?.text
           let t2 = b2.titleLabel?.text
           let t3 = b3.titleLabel?.text
           let t4 = b4.titleLabel?.text
           let t5 = b5.titleLabel?.text
           let t6 = b6.titleLabel?.text
           let t7 = b7.titleLabel?.text
           let t8 = b8.titleLabel?.text
           let t9 = b9.titleLabel?.text
           
           
           
           let o_win_1 = t1 == "O" && t2 == "O" && t3 == "O"
           let o_win_2 = t4 == "O" && t5 == "O" && t6 == "O"
           let o_win_3 = t7 == "O" && t8 == "O" && t9 == "O"
           let o_win_4 = t1 == "O" && t4 == "O" && t7 == "O"
           let o_win_5 = t2 == "O" && t5 == "O" && t8 == "O"
           let o_win_6 = t3 == "O" && t6 == "O" && t9 == "O"
           let o_win_7 = t1 == "O" && t5 == "O" && t9 == "O"
           let o_win_8 = t3 == "O" && t5 == "O" && t7 == "O"
           
           
           if o_win_1 || o_win_2 || o_win_3 || o_win_4 || o_win_5 || o_win_6 || o_win_7 || o_win_8
           {
               print("O wins!")
               
               // stop the game
               endGame("O")
               return true
           }
           return false
       }
    
       
       @IBAction func pressedButton(_ sender: UIButton)
       {
           
           if turn % 2 == 0
           {
            sender.setTitle("X", for: .normal)
               if X_check_winning()
               {
                   return // to cancel the game
               }
           }
           else
           {
               
               // let computer play
               //            sender.setTitle("O", forState: .Normal)
               if  o_check_winning()
               {
                   return
               }
           }
           
           sender.isEnabled = false
           
           
           
           turn += 1
           
           if turn == 9 && (!o_check_winning() || !X_check_winning() )
           {
               endGame("Draw")
               return
           }
           
           // comment this to play 2 players
           computerPlay()
           
           
       }
       
       
       func computerPlay()
       {
           let buttons  = [b1,b2,b3,b4,b5,b6,b7,b8,b9]
           
           var emptyButtonIndecies : [Int] = []
           
           var counter = 0
           for button in buttons
           {
               if button?.titleLabel?.text != "X" && button?.titleLabel?.text != "O"
               {
                   emptyButtonIndecies.append(counter)
               }
               counter += 1
           }
           
           
           
           //•••• VERY EASY LEVEL , randomly choose the places - normally you win•••
           //
           //        let randomNumber = Int(arc4random_uniform(UInt32(emptyButtonIndecies.count - 1)))
           //        print(randomNumber)
           //        let indexToChoose = emptyButtonIndecies[randomNumber]
           //
           //        buttons[indexToChoose].setTitle("O", forState: .Normal)
           //        buttons[indexToChoose].enabled = false
           //
           
           
           // MEDIUM LEVEL (Thinks more)
           computerThinksHarder(emptyButtonIndecies, buttons: buttons)
           
           o_check_winning()
           
           turn+=1
       }
       
       
       func computerThinksHarder(_ emptyButtonIndecies:[Int],buttons:[UIButton?])
       {
           var indexToChoose = emptyButtonIndecies[0]
           var counter = 400
           while !o_check_winning()
           {
            buttons[indexToChoose]?.setTitle("", for: .normal)
               buttons[indexToChoose]?.titleLabel?.text = ""
               
               let randomNumber = Int(arc4random_uniform(UInt32(emptyButtonIndecies.count)))
               indexToChoose = emptyButtonIndecies[randomNumber]
               
            buttons[indexToChoose]?.setTitle("O", for: .normal)
               
               
               
               
               
               
               counter -= 1
               if counter == 0
               {
                   break
               }
           }
           
           buttons[indexToChoose]?.isEnabled = false
       }
       
       func showAlertViewForWinning(_ winner:String)
       {
           let alertController = UIAlertController(title: "WOOHOO", message: "\(winner) won the game!", preferredStyle: .alert)
           let playAgainAction = UIAlertAction(
               title: "play again",
               style: .cancel ,
               handler:  { (alert:UIAlertAction) -> Void in
                   self.playAgain()
           })
        
        
        
        
        
        
           
           alertController.addAction(playAgainAction)
           
           present(alertController,animated: true,completion: nil)
       }
       
       
       
       func playAgain()
       {
           
           clearButtons()
           turn = 0
       }
       
       func clearButtons()
       {
           let arrayOfButton : [UIButton] = [b1,b2,b3,b4,b5,b6,b7,b8,b9]
           arrayOfButton.forEach{ button in
            button.setTitle("", for: .normal)
               button.titleLabel?.text = ""
               button.isEnabled = true
           }
       }
       
       override func viewDidLoad()
       {
           super.viewDidLoad()
           
           
           
           
       }
}


