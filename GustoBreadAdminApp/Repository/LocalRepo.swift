//
//  LocalRepo.swift
//  GustoBreadAdminApp
//
//  Created by Aung Ko Ko on 13/06/2022.
//

import Foundation

class DummyLocalStorage
{
    static let repo = DummyLocalStorage()
    
    var listOfDummyObject = Array<DummyObject>()
    
    private init()
    {
        
    }
}

class DummyObject
{
    var itemID:String?
    var itemName:String?
    var itemUnitPrice:String?
    var categoryID:String?
    var categoryName:String?
    
    init(itemID:String,itemName:String,itemUnitPrice:String,
         categoryID:String,categoryName:String)
    {
        self.itemID = itemID
        self.itemName = itemName
        self.itemUnitPrice = itemUnitPrice
        self.categoryID = categoryID
        self.categoryName = categoryName
    }
}
