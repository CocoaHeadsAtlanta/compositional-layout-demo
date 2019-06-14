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
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalHeight(1),
                                                      heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9),
                                                       heightDimension: .absolute(100))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .groupPagingCentered
                return section
                
            case .memories:
                
                // The bigger, left-hand pic.
                let picItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(2.0/3.0),
                                                         heightDimension: .fractionalHeight(1.0))
                let picItem = NSCollectionLayoutItem(layoutSize: picItemSize)
                picItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
                
                // The mini, thumbnail pics.
                let thumbItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                           heightDimension: .fractionalHeight(1))
                let thumbItem = NSCollectionLayoutItem(layoutSize: thumbItemSize)
                thumbItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
                
                // Group for the thumbnails
                let thumbGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0/3.0),
                                                            heightDimension: .fractionalHeight(1.0))
                let thumbGroup = NSCollectionLayoutGroup.vertical(layoutSize: thumbGroupSize, subitem: thumbItem, count: 2)
                
                // Group for a memory (a pic and two thumbnails)
                let memoryGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                             heightDimension: .fractionalHeight(1.0))
                let memoryGroup = NSCollectionLayoutGroup.horizontal(layoutSize: memoryGroupSize,
                                                                     subitems: [picItem,thumbGroup])
                
                // Group to host the entire section
                let fraction: CGFloat = 0.8
                let sectionGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1 * fraction),
                                                              heightDimension: .fractionalWidth(2.0 * fraction / 3.0))
                let sectionGroup = NSCollectionLayoutGroup.horizontal(layoutSize: sectionGroupSize, subitems: [memoryGroup])
                let section = NSCollectionLayoutSection(group: sectionGroup)
                section.orthogonalScrollingBehavior = .groupPagingCentered
                return section
                
            }
        }
        
    }
    
}

}

