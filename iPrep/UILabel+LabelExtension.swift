//
//  UILabel+LabelExtension.swift
//  iPrep
//
//  Created by Md Shohrab on 11/17/15.
//  Copyright © 2015 VZW. All rights reserved.
//

import UIKit

extension UILabel {
    func currentHeight(_ _text : String, _frame : CGRect) -> CGFloat {
        self.text = _text
        self.font = UIFont.systemFont(ofSize: 17)
        self.numberOfLines = 0
        let neededSize = self.sizeThatFits(CGSize(width: _frame.size.width - 40, height: CGFloat.greatestFiniteMagnitude))
        return neededSize.height
    }
}
