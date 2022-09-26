//
//  AddedItemCollectionViewCell.swift
//  GustoBreadAdminApp
//
//  Created by Aung Ko Ko on 15/06/2022.
//

import UIKit

class AddedItemCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var breadImageObject: UIImageView!
    
    @IBOutlet weak var wholeBackgroundViewForItem: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        addRoundedCorners()
    }
    
}

extension AddedItemCollectionViewCell
{
    private func addRoundedCorners()
    {
        wholeBackgroundViewForItem.clipsToBounds = true
        wholeBackgroundViewForItem.layer.masksToBounds = false
        wholeBackgroundViewForItem.layer.shadowColor = UIColor.black.cgColor
        wholeBackgroundViewForItem.layer.shadowOpacity = 0.14
        wholeBackgroundViewForItem.layer.shadowOffset = CGSize(width: 3, height: 6)
        wholeBackgroundViewForItem.layer.cornerRadius = 14
        
        breadImageObject.clipsToBounds = true
        breadImageObject.layer.cornerRadius = 25
    }
}
