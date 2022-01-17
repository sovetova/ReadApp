//
//  OnBoardCollectionCell.swift
//  ReadApp
//
//  Created by Dilsh on 23.12.2021.
//

import UIKit

class OnBoardCollectionCell: UICollectionViewCell {
    
    
    @IBOutlet weak var imageShow: UIImageView!
    @IBOutlet weak var titleText: UILabel!
    
    func ConfigureCell(_ onBoard:OnBoardDataModel) {
        
        imageShow.image = onBoard.images
        titleText.text = onBoard.title
    }
    
}
