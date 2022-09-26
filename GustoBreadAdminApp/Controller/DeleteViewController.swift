//
//  DeleteViewController.swift
//  GustoBreadAdminApp
//
//  Created by Alvin  on 13/06/2022.
//

import UIKit

class DeleteViewController: UIViewController {
    
    @IBOutlet weak var deleteButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        roundTheCorners()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func onTabDelete(_ sender: Any) {
        
    }
}

extension DeleteViewController
{
    private func roundTheCorners()
    {
        deleteButton.clipsToBounds = true
        deleteButton.layer.cornerRadius = 14
    }
}
