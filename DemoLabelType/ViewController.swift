//
//  ViewController.swift
//  DemoLabelType
//
//  Created by apple on 04/06/19.
//  Copyright © 2019 Rishabh's Mac. All rights reserved.
//

import UIKit
import LTMorphingLabel

class ViewController: UIViewController {
    
    @IBOutlet weak var lblDemo: LTMorphingLabel!
    var i = -1
    var textArray = ["Something","Bigger","Coming","Just","Wait","And","Watch"]
    
    
    fileprivate var text: String {
        i = i >= textArray.count - 1 ? 0 : i + 1
        return textArray[i]
    }
    
    fileprivate var effect: LTMorphingEffect {
        i = i >= textArray.count - 1 ? 0 : i + 1
        if let effect = LTMorphingEffect(rawValue: i) {
            return effect
        }
        return LTMorphingEffect(rawValue: 0)!
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        _ = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (time) in
            self.changeText()
        }
    }

    func changeText(){
        lblDemo.morphingEffect = effect
        lblDemo.textColor = UIColor.random()
        lblDemo.text = text
    }

}

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static func random() -> UIColor {
        return UIColor(red:   .random(),
                       green: .random(),
                       blue:  .random(),
                       alpha: 1.0)
    }
}
