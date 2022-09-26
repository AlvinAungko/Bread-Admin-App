//
//  ItemEditViewController.swift
//  GustoBreadAdminApp
//
//  Created by Aung Ko Ko on 15/06/2022.
//

import UIKit

class ItemEditViewController: UIViewController {
    
    @IBOutlet weak var breadImage: UIImageView!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var blueBackgroundViewForIten: UIView!
    @IBOutlet weak var itemBackgroundView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        addRoundedCorners()
        // Do any additional setup after loading the view.
    }
    @IBAction func onTapSave(_ sender: Any) {
        
    }
    
}

extension ItemEditViewController
{
    private func addRoundedCorners()
    {
        itemBackgroundView.clipsToBounds = true
        itemBackgroundView.layer.masksToBounds = false
        itemBackgroundView.layer.cornerRadius = 14
        itemBackgroundView.layer.shadowOffset = CGSize(width: 1, height: 3)
        itemBackgroundView.layer.shadowColor = UIColor.black.cgColor
        itemBackgroundView.layer.shadowOpacity = 0.14
        
        blueBackgroundViewForIten.clipsToBounds = true
        blueBackgroundViewForIten.layer.cornerRadius = 45
        blueBackgroundViewForIten.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner]
     
        saveButton.clipsToBounds = true
        saveButton.layer.cornerRadius = 14
        
        breadImage.clipsToBounds = true
        breadImage.layer.cornerRadius = 50
    }
}
