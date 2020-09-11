//
//  LandingVC.swift
//  mvvm-ios
//
//  Created by Robert Wan on 21/1/2020.
//  Copyright © 2020 Accenture. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class LandingVC: ViewController {

    @IBOutlet weak var dummyTableView: UITableView!
    
    let landingVM = LandingVM()
    
    let dataSource = RxTableViewSectionedReloadDataSource<SectionOfCustomData>(configureCell: { _, tableView, indexPath, item in
            guard let item = item as? TextTableViewItem, let cell = tableView.dequeueReusableCell(withIdentifier: "DummyTableViewCell", for: indexPath) as? DummyTableViewCell else {
                fatalError("Hello World")
            }
            cell.myLabel.text = item.text
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
    
    func addNextButton() {
        let button = UIButton(type: .custom)
        button.setTitle("Next", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(handleNextButtonClick), for: .touchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
    }
    
    @objc func handleNextButtonClick() {
        print("handleNextButtonClick")
        let nextVC = NextVC()
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addNextButton()
        dummyTableView.register(UINib(nibName: "DummyTableViewCell", bundle: nil), forCellReuseIdentifier: "DummyTableViewCell")
        landingVM.dummyItems.asObservable().bind(to: dummyTableView.rx.items(dataSource: dataSource)).disposed(by: disposeBag)
        
        
        dummyTableView.rx.itemSelected
        
        landingVM.downloadItems()
        
    }
}
