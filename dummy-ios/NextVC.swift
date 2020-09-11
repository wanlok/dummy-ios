//
//  NextVC.swift
//  mvvm-ios
//
//  Created by Robert Wan on 21/1/2020.
//  Copyright © 2020 Accenture. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class NextVC: ViewController {

    @IBOutlet weak var dummyTableView: UITableView!
    
    let nextVM = NextVM()
    
    let dataSource = RxTableViewSectionedReloadDataSource<SectionOfCustomData>(configureCell: { _, tableView, indexPath, item in
            guard let item = item as? TextTableViewItem, let cell = tableView.dequeueReusableCell(withIdentifier: "NextTableViewCell", for: indexPath) as? NextTableViewCell else {
                fatalError("Hello World")
            }
            cell.leftLabel.text = item.text
            return cell
        },
        titleForHeaderInSection: { dataSource, sectionIndex in
            return dataSource[sectionIndex].header
        },
        titleForFooterInSection: { dataSource, sectionIndex in
            return dataSource[sectionIndex].footer
        }
    )
        
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dummyTableView.register(UINib(nibName: "NextTableViewCell", bundle: nil), forCellReuseIdentifier: "NextTableViewCell")
        nextVM.dummyItems.asObservable().bind(to: dummyTableView.rx.items(dataSource: dataSource)).disposed(by: disposeBag)
        nextVM.downloadItems()
    }
}
