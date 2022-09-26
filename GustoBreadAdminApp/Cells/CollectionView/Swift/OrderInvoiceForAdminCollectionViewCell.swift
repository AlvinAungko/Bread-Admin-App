//
//  OrderInvoiceForAdminCollectionViewCell.swift
//  GustoBreadAdminApp
//
//  Created by Aung Ko Ko on 21/06/2022.
//

import UIKit

class OrderInvoiceForAdminCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var curveViewForOrderInvoice: UIView!
    override func awakeFromNib()
    {
        super.awakeFromNib()
        addRoundedCorners()
        // Initialization code
    }
    
}

extension OrderInvoiceForAdminCollectionViewCell
{
    private func addRoundedCorners()
    {
        curveViewForOrderInvoice.clipsToBounds = true
        curveViewForOrderInvoice.layer.masksToBounds = false
        curveViewForOrderInvoice.layer.cornerRadius = 20
        curveViewForOrderInvoice.layer.shadowOpacity = 0.25
        curveViewForOrderInvoice.layer.shadowColor = UIColor.black.cgColor
        curveViewForOrderInvoice.layer.shadowOffset = CGSize(width: 1, height: 3)
        curveViewForOrderInvoice.layer.backgroundColor = UIColor.white.cgColor
    }
}
