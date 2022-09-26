//
//  CustomerTableViewCell.swift
//  GustoBreadAdminApp
//
//  Created by Alvin  on 14/06/2022.
//

import UIKit

class CustomerTableViewCell: UITableViewCell {
    
    @IBOutlet weak var heightOfCustomerCollectionView: NSLayoutConstraint!
    @IBOutlet weak var listOfCustomers: UICollectionView!
    @IBOutlet weak var wholeBackGroundVIew: UIView!
    
    var onTabCustomerTableViewCell:(String)->Void = {_ in}
    var onTabDeleteTableViewCell:(String) -> Void = {_ in}
    var onTabEditTableViewCell:(String)->Void = {_ in}
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupHeightForCollectionView()
        registerCells()
        setUpCollectionView()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

extension CustomerTableViewCell
{
    private func registerCells()
    {
        listOfCustomers.register(UINib(nibName: String(describing: RegisteredCustomers.self), bundle: nil), forCellWithReuseIdentifier: String(describing: RegisteredCustomers.self))
    }
    
    private func setUpCollectionView()
    {
        listOfCustomers.dataSource = self
        listOfCustomers.delegate = self
    }
    
    private func setupHeightForCollectionView()
    {
        heightOfCustomerCollectionView.constant = 200
    }
}


extension CustomerTableViewCell:UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: listOfCustomers.frame.width, height: 170)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = listOfCustomers.dequeueReusableCell(withReuseIdentifier: String(describing: RegisteredCustomers.self), for: indexPath) as? RegisteredCustomers else {return UICollectionViewCell()}
        
        cell.onTabCustomerObject = {
            self.onTabCustomerTableViewCell($0)
        }
        
        cell.onTabDeleteClosure = {
            self.onTabDeleteTableViewCell($0)
        }
        
        cell.onTabEditClosure = {
            self.onTabEditTableViewCell($0)
        }
        
        return cell
    }
    
}
