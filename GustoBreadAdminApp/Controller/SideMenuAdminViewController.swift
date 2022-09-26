//
//  SideMenuAdminViewController.swift
//  GustoBreadAdminApp
//
//  Created by Aung Ko Ko on 13/06/2022.
//

import UIKit

class SideMenuAdminViewController: UIViewController {
    
//    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var reportStackView: UIStackView!
    @IBOutlet weak var addNewCustomerButton: UIButton!
    @IBOutlet weak var addNewBranchButton: UIButton!
    @IBOutlet var entireView: UIView!
    @IBOutlet weak var addNewStaffButton: UIButton!
    @IBOutlet weak var addNewItemButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        addRoundedCorners()
        addGesture()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onTabAddNewItem(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyBoard.instantiateViewController(withIdentifier: "ItemEntryHomeViewController") as? ItemEntryHomeViewController else {return}
        vc.modalTransitionStyle = .coverVertical
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    @IBAction func onTabAddNewStaff(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyBoard.instantiateViewController(withIdentifier: "StaffRegistrationViewController") as? StaffRegistrationViewController else {return}
        vc.modalTransitionStyle = .coverVertical
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
}

extension SideMenuAdminViewController
{
    private func addGesture()
    {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onTabReport))
        reportStackView.addGestureRecognizer(tapGesture)
        reportStackView.isUserInteractionEnabled = true
        
    }
    
    @objc func onTabReport()
    {
      let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyBoard.instantiateViewController(withIdentifier: "AdminOrderInvoiceReportViewController") as? AdminOrderInvoiceReportViewController else {return}
        vc.modalTransitionStyle = .coverVertical
        vc.modalPresentationStyle = .formSheet
        self.present(vc, animated: true, completion: nil)
    }
    
    private func addRoundedCorners()
    {
        addNewItemButton.layer.backgroundColor = UIColor.white.cgColor
        addNewItemButton.clipsToBounds = true
        addNewItemButton.layer.cornerRadius = 15
        addNewItemButton.layer.masksToBounds = false
        addNewItemButton.layer.shadowOpacity = 0.14
        addNewItemButton.layer.shadowOffset = CGSize(width: 3, height: 6)
        addNewItemButton.layer.shadowColor = UIColor.black.cgColor
        
        addNewStaffButton.layer.backgroundColor = UIColor.white.cgColor
        addNewStaffButton.clipsToBounds = true
        addNewStaffButton.layer.cornerRadius = 15
        addNewStaffButton.layer.masksToBounds = false
        addNewStaffButton.layer.shadowOpacity = 0.14
        addNewStaffButton.layer.shadowOffset = CGSize(width: 3, height: 6)
        addNewStaffButton.layer.shadowColor = UIColor.black.cgColor
        
//        profileImage.clipsToBounds = true
//        profileImage.layer.cornerRadius = 14
        
        addNewBranchButton.clipsToBounds = true
        addNewBranchButton.layer.cornerRadius = 14
        
        addNewCustomerButton.clipsToBounds = true
        addNewCustomerButton.layer.cornerRadius = 14
    }
}
