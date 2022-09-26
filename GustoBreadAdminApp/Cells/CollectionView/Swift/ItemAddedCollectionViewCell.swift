//
//  ItemAddedCollectionViewCell.swift
//  GustoBreadAdminApp
//
//  Created by Aung Ko Ko on 13/06/2022.
//

import UIKit

class ItemAddedCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var deleteButtonForItem: UIButton!
    @IBOutlet weak var editButtonForItem: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var categoryName: UILabel!
    @IBOutlet weak var categoryID: UILabel!
    @IBOutlet weak var itemID: UILabel!
    @IBOutlet weak var itemUnitPrice: UILabel!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemEntireView: UIView!
    
    var editClosure:(String)->Void = {_ in}
    var deleteClosure:(String)->Void = {_ in}
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        addRounedCorners()
    }

    @IBAction func onTabEdit(_ sender: Any) {
        editClosure("")
    }
    @IBAction func onTabDelete(_ sender: Any) {
        deleteClosure("")
    }
}

extension ItemAddedCollectionViewCell
{
    private func addRounedCorners()
    {
        itemEntireView.layer.backgroundColor = UIColor.white.cgColor
        itemEntireView.clipsToBounds = true
        itemEntireView.layer.cornerRadius = 15
        itemEntireView.layer.masksToBounds = false
        itemEntireView.layer.shadowOpacity = 0.14
        itemEntireView.layer.shadowOffset = CGSize(width: 1, height: 3)
        itemEntireView.layer.shadowColor = UIColor.black.cgColor
        
        itemImage.clipsToBounds = true
        itemImage.layer.cornerRadius = 14
        
        editButton.clipsToBounds = true
        editButton.layer.cornerRadius = 10
        
        deleteButton.clipsToBounds = true
        deleteButton.layer.cornerRadius = 10
        deleteButton.layer.masksToBounds = false
        deleteButton.layer.shadowOpacity = 0.14
        deleteButton.layer.shadowOffset = CGSize(width: 1, height: 3)
        deleteButton.layer.shadowColor = UIColor.black.cgColor
        
    }
}
