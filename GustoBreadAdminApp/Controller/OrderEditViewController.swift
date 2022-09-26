//
//  OrderEditViewController.swift
//  GustoBreadAdminApp
//
//  Created by Aung Ko Ko on 15/06/2022.
//

import UIKit

class OrderEditViewController: UIViewController {

    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var blueBackgroundViewForOrer: UIView!
    @IBOutlet weak var orderCardView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        addRoundedCorners()
        // Do any additional setup after loading the view.
    }
    
}

extension OrderEditViewController
{
    private func addRoundedCorners()
    {
        blueBackgroundViewForOrer.clipsToBounds = true
        blueBackgroundViewForOrer.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner]
        blueBackgroundViewForOrer.layer.cornerRadius = 45
        
        orderCardView.clipsToBounds = true
        orderCardView.layer.cornerRadius = 15
        orderCardView.layer.masksToBounds = false
        orderCardView.layer.shadowOpacity = 0.14
        orderCardView.layer.shadowOffset = CGSize(width: 3, height: 6)
        orderCardView.layer.shadowColor = UIColor.black.cgColor
        
        saveButton.clipsToBounds = true
        saveButton.layer.cornerRadius = 14
    }
}
