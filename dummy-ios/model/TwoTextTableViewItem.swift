//
//  TwoTextTableViewItem.swift
//  mvvm-ios
//
//  Created by Robert Wan on 22/1/2020.
//  Copyright © 2020 Accenture. All rights reserved.
//

import Foundation

class TwoTextTableViewItem: TableViewItem {
    
    var text1: String
    var text2: String
    
    init(_ text1: String, _ text2: String) {
        self.text1 = text1
        self.text2 = text2
    }
}
