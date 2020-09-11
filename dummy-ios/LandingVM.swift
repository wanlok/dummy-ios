//
//  LandingVM.swift
//  mvvm-ios
//
//  Created by Robert Wan on 21/1/2020.
//  Copyright © 2020 Accenture. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources




class LandingVM {
    
    let dummyItems = BehaviorRelay<[SectionOfCustomData]>(value: [SectionOfCustomData]())
    
    func downloadItems() {
        
        var tableData: [SectionOfCustomData] = [SectionOfCustomData]()
        
        var aItems = [TableViewItem]()
        aItems.append(TextTableViewItem("A1"))
        aItems.append(TextTableViewItem("A2"))
        aItems.append(TextTableViewItem("A3"))
        aItems.append(TextTableViewItem("A4"))
        
        tableData.append(SectionOfCustomData(header: "A Header", footer: "A Footer", items: aItems))
        
        var bItems = [TableViewItem]()
        bItems.append(TextTableViewItem("B1"))
        bItems.append(TextTableViewItem("B2"))
        bItems.append(TextTableViewItem("B3"))
        bItems.append(TextTableViewItem("B4"))
        
        tableData.append(SectionOfCustomData(header: "B Header", footer: "B Footer", items: bItems))
        
        dummyItems.accept(tableData)
    }
}
