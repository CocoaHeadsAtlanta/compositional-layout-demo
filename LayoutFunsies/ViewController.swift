//
//  ViewController.swift
//  LayoutFunsies
//
//  Created by Mikey Ward on 6/13/19.
//  Copyright © 2019 Mikey Ward. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    enum Section: Int {
        case list
        case pics
        case memories
    }
    // MARK: - VC Overrides
    
    
    override func loadView() {
        title = "Meeeemories"
        
        let layout = createLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        view = collectionView
    }


}

