//
//  CategoryDataEntryViewController.swift
//  GustoBreadAdminApp
//
//  Created by Aung Ko Ko on 13/06/2022.
//

import UIKit
import Material

class CategoryDataEntryViewController: UIViewController {

    @IBOutlet weak var categoruNameTextField: TextField!
    @IBOutlet weak var categoryIDTextField: TextField!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var backButton: UIImageView!
    
    let sampleRepo = DummyLocalStorage.repo
    
    var categoryName:String?
    var categoryID:String?
    
    var nameOfTheItem = String()
    var idOfTheItem = String()
    var unitPriceOfTheItem = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addRoundedCorners()
        addGesture()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onTabAddButton(_ sender: Any) {
        categoryID = categoryIDTextField.text ?? ""
        categoryName = categoruNameTextField.text ?? ""
        sampleRepo.listOfDummyObject.append(DummyObject(itemID: "\(idOfTheItem)", itemName: "\(nameOfTheItem)", itemUnitPrice: "\(unitPriceOfTheItem)", categoryID: "\(categoryID ?? "")", categoryName: "\(categoryName ?? "")"))
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyBoard.instantiateViewController(withIdentifier: "SampleViewController") as? SampleViewController else{return}
        vc.modalTransitionStyle = .coverVertical
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
        
    }
}

extension CategoryDataEntryViewController
{
    private func addRoundedCorners()
    {
        addButton.clipsToBounds = true
        addButton.layer.cornerRadius = 10
        
    }
    
    private func addGesture()
    {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onTabBack))
        backButton.isUserInteractionEnabled = true
        backButton.addGestureRecognizer(tapGesture)
    }
    
    @objc func onTabBack()
    {
        self.dismiss(animated: true)
    }
}
