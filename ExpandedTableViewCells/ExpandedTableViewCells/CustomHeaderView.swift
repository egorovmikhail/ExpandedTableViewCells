//
//  CustomHeaderView.swift
//  ExpandedTableViewCells
//
//  Created by Михаил Егоров on 29.06.2020.
//  Copyright © 2020 Михаил Егоров. All rights reserved.
//

import UIKit

class CustomHeaderView: UITableViewHeaderFooterView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    weak var delegate: HeaderViewDelegate?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var headerButton: UIButton!
    
    func configure(title: String, section: Int) { titleLabel.text = title
    headerButton.tag = section
    }
    
    func rotateImage(_ expanded: Bool) { if expanded {
    headerButton.imageView?.transform = CGAffineTransform(rotationAngle: CGFloat.pi) } else {
    headerButton.imageView?.transform = CGAffineTransform(rotationAngle: CGFloat.zero) }
    }
    
    @IBAction func tapHeader(sender: UIButton) { delegate?.expandedSection(button: sender)
    }

}

protocol HeaderViewDelegate: class {
    func expandedSection(button: UIButton)
}
