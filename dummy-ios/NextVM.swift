//
//  NextVM.swift
//  mvvm-ios
//
//  Created by Robert Wan on 21/1/2020.
//  Copyright © 2020 Accenture. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

//extension SectionOfCustomData: SectionModelType {
//    typealias Item = String
//
//    init(original: SectionOfCustomData, items: [Item]) {
//        self = original
//        self.items = items
//    }
//}

class NextVM {
    
    let dummyItems = BehaviorRelay<[SectionOfCustomData]>(value: [SectionOfCustomData]())
    
    func downloadItems() {
        
        var tableData: [SectionOfCustomData] = [SectionOfCustomData]()
        
        var cItems = [TableViewItem]()
        cItems.append(TextTableViewItem("C1"))
        cItems.append(TextTableViewItem("C2"))
        cItems.append(TextTableViewItem("C3"))
        cItems.append(TextTableViewItem("C4"))
        
        tableData.append(SectionOfCustomData(header: "C Header", footer: "C Footer", items: cItems))
        
        var dItems = [TableViewItem]()
        dItems.append(TextTableViewItem("D1"))
        dItems.append(TextTableViewItem("D2"))
        dItems.append(TextTableViewItem("D3"))
        dItems.append(TextTableViewItem("D4"))
        
        tableData.append(SectionOfCustomData(header: "D Header", footer: "D Footer", items: dItems))
        
        dummyItems.accept(tableData)
    }
}
