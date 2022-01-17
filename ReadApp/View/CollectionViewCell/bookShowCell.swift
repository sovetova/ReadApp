//
//  bookShowCell.swift
//  ReadApp
//
//  Created by Dilsh on 23.12.2021.
//

import UIKit

class bookShowCell: UICollectionViewCell {
    
    
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var bookName: UILabel!
    @IBOutlet weak var backView: UIView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        bookImage.layer.cornerRadius = 10
        bookImage.layer.masksToBounds = true
    }
    

}
