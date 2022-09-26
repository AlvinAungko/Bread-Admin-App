//
//  StaffRegistrationViewController.swift
//  GustoBreadAdminApp
//
//  Created by Alvin  on 14/06/2022.
//

import UIKit

class StaffRegistrationViewController: UIViewController {
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var backButton: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        addRoundedCorners()
        addGesture()
        // Do any additional setup after loading the view.
    }
    @IBAction func onTabAdd(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyBoard.instantiateViewController(withIdentifier: "SampleViewController") as? SampleViewController else {return}
        vc.modalTransitionStyle = .coverVertical
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    
}

extension StaffRegistrationViewController
{
    private func addRoundedCorners()
    {
        addButton.clipsToBounds = true
        addButton.layer.cornerRadius = 14
        
    }
    
    private func addGesture()
    {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onTabBack))
        backButton.isUserInteractionEnabled = true
        backButton.addGestureRecognizer(tapGesture)
    }
    
    @objc func onTabBack()
    {
        self.dismiss(animated: true, completion: nil)
    }
}
