//
//  VC3.swift
//  X-O Game
//
//  Created by saad on 3/21/20.
//  Copyright © 2020 X-O Game. All rights reserved.
//

import UIKit
import Foundation
import AVFoundation

    enum Vibration {
    case error
    case success
    case warning
    case light
    case medium
    case heavy
    case selection
    case oldSchool

    func vibrate() {

      switch self {
      case .error:
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.error)

      case .success:
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)

      case .warning:
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.warning)

      case .light:
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.impactOccurred()

      case .medium:
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()

      case .heavy:
        let generator = UIImpactFeedbackGenerator(style: .heavy)
        generator.impactOccurred()

      case .selection:
        let generator = UISelectionFeedbackGenerator()
        generator.selectionChanged()

      case .oldSchool:
        AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
      }

    }
        
        

}


class VC3: UIViewController {

    let generator = UINotificationFeedbackGenerator()

    
    

    
    



    

    override func viewDidLoad() {
        super.viewDidLoad()
        

        print("Hi I'am VC3 ")
        print("Welcome To my screen")
        // Do any additional setup after loading the view.
    }
    
    @IBAction func Button(_ sender: Any) {
        
        print("Button For VC3")
        Vibration.error.vibrate()

    }
    @IBAction func Button1(_ sender: Any) {
        
        print("Button For VC3")
      //  generator.notificationOccurred(.success)
        Vibration.heavy.vibrate()


    }
    @IBAction func Button2(_ sender: Any) {
        
        print("Button For VC3")
        //generator.notificationOccurred(.success)
        Vibration.light.vibrate()


    }
    @IBAction func Button3(_ sender: Any) {
        
        print("Button For VC3")
        Vibration.medium.vibrate()


    }
    @IBAction func Button4(_ sender: Any) {
        
        print("Button For VC3")
        Vibration.oldSchool.vibrate()


    }
    @IBAction func Button5(_ sender: Any) {
        
        print("Button For VC3")
        Vibration.selection.vibrate()
    
    }
    @IBAction func Button6(_ sender: Any) {
        
        print("Button For VC3")
        Vibration.success.vibrate()
    
    }
    @IBAction func Button7(_ sender: Any) {
        
        print("Button For VC3")
        Vibration.warning.vibrate()
    
    }
    @IBAction func Button8(_ sender: Any) {
        
        print("Button For VC3")
        generator.notificationOccurred(.error)

        
    
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
