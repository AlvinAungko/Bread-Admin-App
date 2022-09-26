//
//  OrderCollectionViewCell.swift
//  GustoBreadAdminApp
//
//  Created by Aung Ko Ko on 13/06/2022.
//

import UIKit

class StaffListCollectionViewCell: UICollectionViewCell {

    var onTabEdit:(Int)->Void = {_ in}
    var onTabDelete:(Int,String)->Void = {_,_ in}
    
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var staffName: UILabel!
    @IBOutlet weak var staffID: UILabel!
    @IBOutlet weak var staffProfile: UIImageView!
    @IBOutlet weak var staffCellEntireView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        addRounedCorners()
        // Initialization code
    }
    @IBAction func onTabEdit(_ sender: Any) {
        debugPrint("Tabbed")
        onTabEdit(1001)
    }
    
    @IBAction func onTabDelete(_ sender: Any) {
        onTabDelete(1001,"")
    }
}

extension StaffListCollectionViewCell
{
    private func addRounedCorners()
    {
        editButton.layer.cornerRadius = 10
        editButton.clipsToBounds = true
        
        deleteButton.clipsToBounds = true
        deleteButton.layer.cornerRadius = 10
        deleteButton.layer.masksToBounds = false
        deleteButton.layer.shadowOpacity = 0.14
        deleteButton.layer.shadowOffset = CGSize(width: 1, height: 3)
        deleteButton.layer.shadowColor = UIColor.black.cgColor
        
        staffCellEntireView.clipsToBounds = true
        staffCellEntireView.layer.cornerRadius = 15
        staffCellEntireView.layer.masksToBounds = false
        staffCellEntireView.layer.shadowOpacity = 0.14
        staffCellEntireView.layer.shadowOffset = CGSize(width: 3, height: 6)
        staffCellEntireView.layer.shadowColor = UIColor.black.cgColor
        
        staffProfile.clipsToBounds = true
        staffProfile.layer.cornerRadius = 38
        
    }
}
