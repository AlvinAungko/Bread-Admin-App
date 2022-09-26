//
//  ItemSelectionTableViewCell.swift
//  GustoBreadAdminApp
//
//  Created by Aung Ko Ko on 13/06/2022.
//

import UIKit

class ItemSelectionTableViewCell: UITableViewCell {

    @IBOutlet weak var heightOfItemCollectionView: NSLayoutConstraint!
    @IBOutlet weak var itemList: UICollectionView!
    
    var onTapEditCell:(String)->Void = {_ in}
    var onTapDeleteCell:(String)->Void = {_ in}
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupHeightForItemList()
        registerCells()
        setupCollectionView()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension ItemSelectionTableViewCell
{
    private func setupCollectionView()
    {
        itemList.dataSource = self
        itemList.delegate = self
    }
    
    private func registerCells()
    {
        itemList.register(UINib(nibName: String(describing: ItemAddedCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: ItemAddedCollectionViewCell.self))
    }
    
    private func setupHeightForItemList()
    {
        heightOfItemCollectionView.constant = 210
    }
}

extension ItemSelectionTableViewCell:UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = itemList.dequeueReusableCell(withReuseIdentifier: String(describing: ItemAddedCollectionViewCell.self), for: indexPath) as? ItemAddedCollectionViewCell else {return UICollectionViewCell()}
        
        cell.editClosure = {
            self.onTapEditCell($0)
        }
        
        cell.deleteClosure = {
            id in
            self.onTapDeleteCell(id)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: itemList.frame.width-25, height: 210)
    }
}

