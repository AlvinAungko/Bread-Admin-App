//
//  OrderInvoiceCollectionViewCell.swift
//  GustoBreadAdminApp
//
//  Created by Alvin  on 14/06/2022.
//

import UIKit

class OrderInvoiceCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var wholeBackgroundView: UIView!
    
    var editClosure:(String)->Void = {_ in}
    var deleteClosure:(String)->Void = {_ in}
    var onTabCustomer:(String)->Void = {_ in}
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addGesture()
        adddRoundedCorners()
        // Initialization code
    }
    
    @IBAction func onTabEdit(_ sender: Any) {
        editClosure("")
        
    }
    @IBAction func onTabDelete(_ sender: Any) {
        deleteClosure("")
    }
}

extension OrderInvoiceCollectionViewCell
{
    private func adddRoundedCorners()
    {
        editButton.layer.cornerRadius = 10
        editButton.clipsToBounds = true
        
        deleteButton.clipsToBounds = true
        deleteButton.layer.cornerRadius = 15
        deleteButton.layer.masksToBounds = false
        deleteButton.layer.shadowOpacity = 0.14
        deleteButton.layer.shadowOffset = CGSize(width: 1, height: 3)
        deleteButton.layer.shadowColor = UIColor.black.cgColor
        
        wholeBackgroundView.clipsToBounds = true
        wholeBackgroundView.layer.cornerRadius = 15
        wholeBackgroundView.layer.masksToBounds = false
        wholeBackgroundView.layer.shadowOpacity = 0.14
        wholeBackgroundView.layer.shadowOffset = CGSize(width: 3, height: 6)
        wholeBackgroundView.layer.shadowColor = UIColor.black.cgColor
        
    }
    
    private func addGesture()
    {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onTapCard))
        wholeBackgroundView.isUserInteractionEnabled = true
        wholeBackgroundView.addGestureRecognizer(tapGesture)
    }
    
    @objc func onTapCard()
    {
       onTabCustomer("")
    }
}
