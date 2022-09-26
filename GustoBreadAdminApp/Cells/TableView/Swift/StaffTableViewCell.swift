//
//  StaffTableViewCell.swift
//  GustoBreadAdminApp
//
//  Created by Aung Ko Ko on 13/06/2022.
//

import UIKit

class StaffTableViewCell: UITableViewCell {
    
    @IBOutlet weak var heightOfStaffList: NSLayoutConstraint!
    @IBOutlet weak var staffList: UICollectionView!
    
    var onTabTableViewCell:(Int)->Void = {_ in}
    var onTabDelete:(Int,String)->Void = {_,_ in}
    
    
    override func awakeFromNib() {
        registerCells()
        setupHeightForCollectionView()
        setupCollectionView()
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

extension StaffTableViewCell
{
    private func setupCollectionView()
    {
        staffList.dataSource = self
        staffList.delegate = self
    }
    
    private func setupHeightForCollectionView()
    {
        heightOfStaffList.constant = 160
    }
    
    private func registerCells()
    {
        staffList.register(UINib(nibName: String(describing: StaffListCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: StaffListCollectionViewCell.self))
    }
    
}

extension StaffTableViewCell:UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = staffList.dequeueReusableCell(withReuseIdentifier: String(describing: StaffListCollectionViewCell.self), for: indexPath) as? StaffListCollectionViewCell else {return UICollectionViewCell()}
        cell.onTabEdit = {
            self.onTabTableViewCell($0)
        }
        
        cell.onTabDelete = {
            self.onTabDelete($0,$1)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: staffList.bounds.width-25, height: 150)
    }
}


