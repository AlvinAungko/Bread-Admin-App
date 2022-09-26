//
//  OrderDetailViewController.swift
//  GustoBreadAdminApp
//
//  Created by Aung Ko Ko on 15/06/2022.
//

import UIKit

class OrderDetailViewController: UIViewController {

    @IBOutlet weak var backButton: UIImageView!
    @IBOutlet weak var itemList: UICollectionView!
    @IBOutlet weak var heightOfItemList: NSLayoutConstraint!
    @IBOutlet weak var backgroundBlueView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        roundTheCorners()
        registerCells()
        setupHeightForCollectionView()
        initCollectionView()
        addGesture()
        // Do any additional setup after loading the view.
    }
    

}

extension OrderDetailViewController
{
    private func roundTheCorners()
    {
        backgroundBlueView.clipsToBounds = true
        backgroundBlueView.layer.masksToBounds = false
        backgroundBlueView.layer.cornerRadius = 35
        backgroundBlueView.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMinXMinYCorner]
        
//        backgroundBlueView.layer.backgroundColor = UIColor.white.cgColor
        backgroundBlueView.layer.shadowColor = UIColor.black.cgColor
        backgroundBlueView.layer.shadowOpacity = 1
        backgroundBlueView.layer.shadowOffset = CGSize(width: 1, height: 3)
        
        
    }
    
}

extension OrderDetailViewController
{
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

extension OrderDetailViewController
{
    private func initCollectionView()
    {
        itemList.dataSource = self
        itemList.delegate = self
    }
    
    private func setupHeightForCollectionView()
    {
        heightOfItemList.constant = 420
        
    }
    
    private func registerCells()
    {
        itemList.register(UINib(nibName: String(describing: AddedItemCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: AddedItemCollectionViewCell.self))
    }
}

extension OrderDetailViewController:UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = itemList.dequeueReusableCell(withReuseIdentifier: String(describing: AddedItemCollectionViewCell.self), for: indexPath) as? AddedItemCollectionViewCell else {return UICollectionViewCell()}
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: itemList.bounds.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
}
