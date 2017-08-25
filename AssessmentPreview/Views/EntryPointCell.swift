//
//  EntryPointCell.swift
//  AssessmentPreview
//
//  Created by Michael De La Cruz on 8/21/17.
//  Copyright © 2017 Michael De La Cruz. All rights reserved.
//

import UIKit

class EntryPointCell: UITableViewCell {
    
    var imgView: UIImageView?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    // seting up the cells' view
    fileprivate func setup() {
        self.backgroundColor = .clear
        imgView = UIImageView(frame: self.frame)
        addSubview(imgView!)
        imgView?.isUserInteractionEnabled = true
        imgView?.contentMode = .center
        imgView?.translatesAutoresizingMaskIntoConstraints = false
        
        guard let leading = imgView?.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            let top = imgView?.topAnchor.constraint(equalTo: self.topAnchor),
            let trailing = imgView?.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            let bottom = imgView?.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            
            else {fatalError()}
        
        NSLayoutConstraint.activate([leading,top,trailing,bottom])
    }
    
    func configure(img: UIImage?) {
        imgView?.image = img
    }

}

