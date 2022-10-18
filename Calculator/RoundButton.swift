//
//  RoundButton.swift
//  Calculator
//
//  Created by 이승재 on 2022/10/18.
//

import UIKit

@IBDesignable

class RoundButton: UIButton {
    @IBInspectable var isRound: Bool = false {
        didSet {
            if isRound {
                self.layer.cornerRadius = self.frame.height / 2
            }
        }
    }

}
