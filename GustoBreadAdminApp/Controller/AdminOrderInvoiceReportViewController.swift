//
//  AdminOrderInvoiceReportViewController.swift
//  GustoBreadAdminApp
//
//  Created by Aung Ko Ko on 21/06/2022.
//

import UIKit

class AdminOrderInvoiceReportViewController: UIViewController {
    
    @IBOutlet weak var customerComplainView: UIView!
    @IBOutlet weak var salesReportView: UIView!
    @IBOutlet weak var heightOfOrderInvoiceList: NSLayoutConstraint!
    @IBOutlet weak var orderInvoiceCollectionview: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        addRoundedCorners()
        setupHeightForCollectionView()
        registerCells()
        initCollectionView()
        // Do any additional setup after loading the view.
    }
    
    
}

extension AdminOrderInvoiceReportViewController
{
    private func setupHeightForCollectionView()
    {
        heightOfOrderInvoiceList.constant = 400
    }
    
    private func registerCells()
    {
        orderInvoiceCollectionview.register(UINib(nibName: String(describing: OrderInvoiceForAdminCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: OrderInvoiceForAdminCollectionViewCell.self))
    }
    
    private func initCollectionView()
    {
        orderInvoiceCollectionview.dataSource = self
        orderInvoiceCollectionview.delegate = self
    }
    
    private func addRoundedCorners()
    {
        salesReportView.clipsToBounds = true
        salesReportView.layer.cornerRadius = 24
        salesReportView.layer.masksToBounds = false
        salesReportView.layer.shadowColor = UIColor.black.cgColor
        salesReportView.layer.shadowOffset = CGSize(width: 1, height: 3)
        salesReportView.layer.shadowOpacity = 0.14
        salesReportView.layer.backgroundColor = UIColor.white.cgColor
        
        customerComplainView.clipsToBounds = true
        customerComplainView.layer.cornerRadius = 24
        customerComplainView.layer.masksToBounds = false
        customerComplainView.layer.shadowColor = UIColor.black.cgColor
        customerComplainView.layer.shadowOffset = CGSize(width: 1, height: 3)
        customerComplainView.layer.shadowOpacity = 0.14
        customerComplainView.layer.backgroundColor = UIColor.white.cgColor
    }
}

extension AdminOrderInvoiceReportViewController:UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: orderInvoiceCollectionview.bounds.width, height: 350)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = orderInvoiceCollectionview.dequeueReusableCell(withReuseIdentifier: String(describing: OrderInvoiceForAdminCollectionViewCell.self), for: indexPath) as? OrderInvoiceForAdminCollectionViewCell else {
            return UICollectionViewCell()
        }
        return cell
    }
}
