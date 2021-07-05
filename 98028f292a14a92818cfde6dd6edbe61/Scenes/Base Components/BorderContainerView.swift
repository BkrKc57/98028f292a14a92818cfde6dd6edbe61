//
//  BorderContainerView.swift
//  98028f292a14a92818cfde6dd6edbe61
//
//  Created by MacOS on 1.07.2021.
//

import UIKit

class BorderContainerView: UIView {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.layer.borderColor = UIColor().customColor.cgColor
        self.layer.borderWidth = 2
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
}
