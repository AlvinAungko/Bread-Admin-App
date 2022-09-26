//
//  ItemEntryHomeViewController.swift
//  GustoBreadAdminApp
//
//  Created by Aung Ko Ko on 12/06/2022.
//

import UIKit

class ItemEntryHomeViewController: UIViewController {
    
    @IBOutlet weak var backButton: UIImageView!
    @IBOutlet weak var getStartedButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        roundTheCorners()
        addGesture()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onTabGestStarted(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyBoard.instantiateViewController(withIdentifier: "DataEntryForItemIDandItemNameViewController") as? DataEntryForItemIDandItemNameViewController else{return}
        vc.modalTransitionStyle = .coverVertical
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    
}

extension ItemEntryHomeViewController
{
    private func roundTheCorners()
    {
        getStartedButton.layer.cornerRadius = 10
        getStartedButton.clipsToBounds = true
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
