//
//  EditViewController.swift
//  GustoBreadAdminApp
//
//  Created by Alvin  on 13/06/2022.
//

import UIKit

class EditViewController: UIViewController {
    
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileBackgroundView: UIView!
    @IBOutlet weak var blueBackgroundView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        addRoundedCorners()
        // Do any additional setup after loading the view.
    }
    
    
}

extension EditViewController
{
    private func addRoundedCorners()
    {
        blueBackgroundView.clipsToBounds = true
        blueBackgroundView.layer.cornerRadius = 45
        blueBackgroundView.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner]
        
        profileBackgroundView.clipsToBounds = true
        profileBackgroundView.layer.cornerRadius = 15
        profileBackgroundView.layer.masksToBounds = false
        profileBackgroundView.layer.shadowOpacity = 0.14
        profileBackgroundView.layer.shadowOffset = CGSize(width: 3, height: 6)
        profileBackgroundView.layer.shadowColor = UIColor.black.cgColor
        
        saveButton.layer.backgroundColor = UIColor.white.cgColor
        saveButton.clipsToBounds = true
        saveButton.layer.cornerRadius = 15
        saveButton.layer.masksToBounds = false
        saveButton.layer.shadowOpacity = 0.14
        saveButton.layer.shadowOffset = CGSize(width: 3, height: 6)
        saveButton.layer.shadowColor = UIColor.black.cgColor
        
        profileImage.clipsToBounds = true
        profileImage.layer.cornerRadius = 50
    }
    
    
}
