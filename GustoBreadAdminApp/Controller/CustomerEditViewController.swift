//
//  CustomerEditViewController.swift
//  GustoBreadAdminApp
//
//  Created by Aung Ko Ko on 15/06/2022.
//

import UIKit

class CustomerEditViewController: UIViewController {
    
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var customerProfileImage: UIImageView!
    @IBOutlet weak var profileBackgroundView: UIView!
    @IBOutlet weak var blueBackGroundCustomerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        addRoundedCorners()
        // Do any additional setup after loading the view.
    }
    
}

extension CustomerEditViewController
{
    private func addRoundedCorners()
    {
        blueBackGroundCustomerView.clipsToBounds = true
        blueBackGroundCustomerView.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner]
        blueBackGroundCustomerView.layer.cornerRadius = 45
        
        profileBackgroundView.clipsToBounds = true
        profileBackgroundView.layer.cornerRadius = 15
        profileBackgroundView.layer.masksToBounds = false
        profileBackgroundView.layer.shadowOpacity = 0.14
        profileBackgroundView.layer.shadowOffset = CGSize(width: 3, height: 6)
        profileBackgroundView.layer.shadowColor = UIColor.black.cgColor
        
        customerProfileImage.clipsToBounds = true
        customerProfileImage.layer.cornerRadius = 50
            
        saveButton.clipsToBounds = true
        saveButton.layer.cornerRadius = 14
    }
    
    
}
