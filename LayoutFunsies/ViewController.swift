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
    
    var collectionView: UICollectionView! = nil
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
    
    func createLayout() -> UICollectionViewLayout {

        return UICollectionViewCompositionalLayout { (section, env) -> NSCollectionLayoutSection? in
            switch Section(rawValue: section)! {
            case .list:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                      heightDimension: .fractionalHeight(0.9))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                       heightDimension: .absolute(44))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                               subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                return section
                
            case .pics:
                
            case .memories:
            }
        }
        
    }
    
}

}

