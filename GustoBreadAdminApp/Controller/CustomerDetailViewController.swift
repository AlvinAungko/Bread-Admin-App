//
//  CustomerDetailViewController.swift
//  GustoBreadAdminApp
//
//  Created by Alvin  on 14/06/2022.
//

import UIKit
import FittedSheets

class CustomerDetailViewController: UIViewController {
    @IBOutlet weak var blueBackGround: UIView!
    @IBOutlet weak var userProfileView: UIView!
    
    @IBOutlet weak var heightOfOrderlist: NSLayoutConstraint!
    @IBOutlet weak var orderList: UICollectionView!
    @IBOutlet weak var customerProfile: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        addRoundedCorners()
        setupHeightForCollectionView()
        registerCells()
        initCollectionView()
        
        
        // Do any additional setup after loading the view.
    }
    
    
}

extension CustomerDetailViewController
{
    private func initCollectionView()
    {
        orderList.dataSource = self
        orderList.delegate = self
    }
    
    private func registerCells()
    {
        orderList.register(UINib(nibName: String(describing: OrderInvoiceCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: OrderInvoiceCollectionViewCell.self))
    }
    
    private func setupHeightForCollectionView()
    {
        heightOfOrderlist.constant = 230
    }
    
}

extension CustomerDetailViewController
{
    private func addRoundedCorners()
    {
        blueBackGround.clipsToBounds = true
        blueBackGround.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner]
        blueBackGround.layer.cornerRadius = 45
        
        userProfileView.clipsToBounds = true
        userProfileView.layer.cornerRadius = 15
        userProfileView.layer.masksToBounds = false
        userProfileView.layer.shadowOpacity = 0.14
        userProfileView.layer.shadowOffset = CGSize(width: 3, height: 6)
        userProfileView.layer.shadowColor = UIColor.black.cgColor
        
        customerProfile.clipsToBounds = true
        customerProfile.layer.cornerRadius = 50
    }
    
}

extension CustomerDetailViewController:UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: orderList.frame.width, height: 230)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = orderList.dequeueReusableCell(withReuseIdentifier: String(describing: OrderInvoiceCollectionViewCell.self), for: indexPath) as? OrderInvoiceCollectionViewCell else {return UICollectionViewCell()}
        
        cell.onTabCustomer = {
            id in
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let vc = storyboard.instantiateViewController(withIdentifier: "OrderDetailViewController") as? OrderDetailViewController else {return}
//            let controller = SheetViewController(controller: vc, sizes:[.fixed(650)])
//            self.present(controller, animated: true, completion: nil)
            vc.modalTransitionStyle = .coverVertical
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        }
        
        cell.editClosure = {
            id in
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let vc = storyboard.instantiateViewController(withIdentifier: "OrderEditViewController") as? OrderEditViewController else {return}
            vc.modalTransitionStyle = .coverVertical
            vc.modalPresentationStyle = .formSheet
            self.present(vc, animated: true, completion: nil)
        }
        
        cell.deleteClosure = {
            id in
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            guard let vc = storyBoard.instantiateViewController(withIdentifier: "DeleteViewController") as? DeleteViewController else {return}
            let controller = SheetViewController(controller: vc, sizes:[.fixed(375)])
            self.present(controller, animated: true, completion: nil)
        }
        
        return cell
    }
}
