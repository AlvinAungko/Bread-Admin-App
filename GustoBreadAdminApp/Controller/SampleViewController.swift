//
//  SampleViewController.swift
//  GustoBreadAdminApp
//
//  Created by Aung Ko Ko on 13/06/2022.
//

import UIKit
import FittedSheets

class SampleViewController: UIViewController {

    @IBOutlet weak var adminAbilityTableView: UITableView!
    let shared = DummyLocalStorage.repo
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchTheData()
        registerTableViewCells()
        setUpTableView()

        // Do any additional setup after loading the view.
    }
    
    private func fetchTheData()
    {
        debugPrint(shared.listOfDummyObject.count)
    }

}

extension SampleViewController
{
    private func setUpTableView()
    {
        adminAbilityTableView.dataSource = self
        adminAbilityTableView.delegate = self
    }
    
    private func setUpHeightForTableView()
    {
        
    }
    
    private func registerTableViewCells()
    {
        adminAbilityTableView.register(UINib(nibName: String(describing: ItemSelectionTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: ItemSelectionTableViewCell.self))
        
        adminAbilityTableView.register(UINib(nibName: String(describing: StaffTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: StaffTableViewCell.self))
        
        adminAbilityTableView.register(UINib(nibName: String(describing: CustomerTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: CustomerTableViewCell.self))
        
    }
}

extension SampleViewController:UITableViewDataSource,UITableViewDelegate
{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section
        {
        case 0:
            guard let cell = adminAbilityTableView.dequeueReusableCell(withIdentifier: String(describing: ItemSelectionTableViewCell.self), for: indexPath) as? ItemSelectionTableViewCell else {return UITableViewCell()}
            
            cell.onTapEditCell = {
                id in
                let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                guard let vc = storyBoard.instantiateViewController(withIdentifier: "ItemEditViewController") as? ItemEditViewController else {return}
                vc.modalPresentationStyle = .formSheet
                vc.modalTransitionStyle = .coverVertical
                self.present(vc, animated: true, completion: nil)
            }
            
            cell.onTapDeleteCell = {
                itemID in
                let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                guard let vc = storyBoard.instantiateViewController(withIdentifier: "DeleteViewController") as? DeleteViewController else {return}
                let controller = SheetViewController(controller: vc, sizes:[.fixed(375)])
//                vc.modalTransitionStyle = .coverVertical
//                vc.modalPresentationStyle = .formSheet
                self.present(controller, animated: true, completion: nil)
            }
            
            return cell
        case 1:
            guard let cell = adminAbilityTableView.dequeueReusableCell(withIdentifier: String(describing: StaffTableViewCell.self), for: indexPath) as? StaffTableViewCell else {return UITableViewCell()}
            cell.onTabTableViewCell = {
                staffID in
                let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                guard let vc = storyBoard.instantiateViewController(withIdentifier: "EditViewController") as? EditViewController else {return}
                vc.modalTransitionStyle = .coverVertical
                vc.modalPresentationStyle = .formSheet
                self.present(vc, animated: true, completion: nil)
            }
            
            cell.onTabDelete = {
                staffID,staffName in
                let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                guard let vc = storyBoard.instantiateViewController(withIdentifier: "DeleteViewController") as? DeleteViewController else {return}
                let controller = SheetViewController(controller: vc, sizes:[.fixed(375)])
                self.present(controller, animated: true, completion: nil)
            }
            
            return cell
            
        case 2:
            guard let cell = adminAbilityTableView.dequeueReusableCell(withIdentifier: String(describing: CustomerTableViewCell.self), for: indexPath) as? CustomerTableViewCell else {return UITableViewCell()}
            
            cell.onTabCustomerTableViewCell = {
                id in
                let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                guard let vc = storyBoard.instantiateViewController(withIdentifier: "CustomerDetailViewController") as? CustomerDetailViewController else {return}
                vc.modalTransitionStyle = .coverVertical
                vc.modalPresentationStyle = .formSheet
                self.present(vc, animated: true, completion: nil)
            }
            
            
            cell.onTabEditTableViewCell = {
                id in
                let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                guard let vc = storyBoard.instantiateViewController(withIdentifier: "CustomerEditViewController") as? CustomerEditViewController else {return}
                vc.modalTransitionStyle = .coverVertical
                vc.modalPresentationStyle = .formSheet
                self.present(vc, animated: true, completion: nil)
            }
            
            cell.onTabDeleteTableViewCell = {
                id in
                let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                guard let vc = storyBoard.instantiateViewController(withIdentifier: "DeleteViewController") as? DeleteViewController else {return}
                let controller = SheetViewController(controller: vc, sizes:[.fixed(375)])
//                vc.modalTransitionStyle = .coverVertical
//                vc.modalPresentationStyle = .formSheet
                self.present(controller, animated: true, completion: nil)
            }
            
            return cell
            
        default: return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section
        {
        case 0: return 250
        case 1: return 200
        case 2: return 260
        default: return 0
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
}
