//
//  RegisteredCustomers.swift
//  GustoBreadAdminApp
//
//  Created by Alvin  on 14/06/2022.
//

import UIKit

class RegisteredCustomers: UICollectionViewCell {
    
    @IBOutlet weak var wholeCustomerBackGroundView: UIView!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var customerProfileImage: UIImageView!
    
    var onTabEditClosure:(String)->Void = {_ in}
    var onTabDeleteClosure:(String)->Void = {_ in}
    var onTabCustomerObject:(String)->Void = {_ in}
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addRoundedCorners()
        addGesture()
        // Initialization code
    }
    @IBAction func onTabEdit(_ sender: Any) {
        onTabEditClosure("C001")
    }
    @IBAction func onTabDelete(_ sender: Any) {
        onTabDeleteClosure("C001")
    }
    
}

extension RegisteredCustomers
{
    private func addRoundedCorners()
    {
        customerProfileImage.clipsToBounds = true
        customerProfileImage.layer.cornerRadius = 38
        
        editButton.clipsToBounds = true
        editButton.layer.cornerRadius = 10
        
        deleteButton.layer.backgroundColor = UIColor.white.cgColor
        deleteButton.clipsToBounds = true
        deleteButton.layer.cornerRadius = 10
        deleteButton.layer.masksToBounds = false
        deleteButton.layer.shadowOpacity = 0.14
        deleteButton.layer.shadowOffset = CGSize(width: 3, height: 6)
        deleteButton.layer.shadowColor = UIColor.black.cgColor
        
        wholeCustomerBackGroundView.layer.backgroundColor = UIColor.white.cgColor
        wholeCustomerBackGroundView.clipsToBounds = true
        wholeCustomerBackGroundView.layer.cornerRadius = 15
        wholeCustomerBackGroundView.layer.masksToBounds = false
        wholeCustomerBackGroundView.layer.shadowOpacity = 0.14
        wholeCustomerBackGroundView.layer.shadowOffset = CGSize(width: 3, height: 6)
        wholeCustomerBackGroundView.layer.shadowColor = UIColor.black.cgColor
    }
}

extension RegisteredCustomers
{
    private func addGesture()
    {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onTabCell))
        wholeCustomerBackGroundView.isUserInteractionEnabled = true
        wholeCustomerBackGroundView.addGestureRecognizer(tapGesture)
    }
    
    @objc func onTabCell()
    {
        onTabCustomerObject("")
    }
}
