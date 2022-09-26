//
//  DataEntryForItemIDandItemNameViewController.swift
//  GustoBreadAdminApp
//
//  Created by Aung Ko Ko on 13/06/2022.
//

import UIKit
import Material

class DataEntryForItemIDandItemNameViewController: UIViewController {
    
    var itemID:String?
    var itemName:String?
    var itemUnitPrice:String?
    
    @IBOutlet weak var itemUnitPriceTextField: TextField!
    @IBOutlet weak var itemIDTextField: TextField!
    @IBOutlet weak var itemNameTextField: TextField!
    @IBOutlet weak var backButton: UIImageView!
    @IBOutlet weak var nextButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        roundTheCorners()
        setupDataForIDandName()
        addGesture()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onTabNextButton(_ sender: Any) {
        
        itemName = itemNameTextField.text ?? ""
        itemUnitPrice = itemUnitPriceTextField.text ?? ""
        itemID = itemIDTextField.text ?? ""
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyBoard.instantiateViewController(withIdentifier: "CategoryDataEntryViewController") as? CategoryDataEntryViewController else{return}
        vc.modalTransitionStyle = .coverVertical
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
}

extension DataEntryForItemIDandItemNameViewController
{
    private func addGesture()
    {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(onTabBack))
        backButton.isUserInteractionEnabled = true
        backButton.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func onTabBack()
    {
        self.dismiss(animated: true)
    }
}

extension DataEntryForItemIDandItemNameViewController
{
    
    private func setupDataForIDandName()
    {
        
    }
    
    private func roundTheCorners()
    {
        
        nextButton.clipsToBounds = true
        nextButton.layer.cornerRadius = 15
        
        //       nextButton.layer.masksToBounds = false
        //       nextButton.layer.shadowOpacity = 0.14
        //       nextButton.layer.shadowOffset = CGSize(width: 1, height: 3)
        //       nextButton.layer.shadowColor = UIColor.black.cgColor
    }
}
