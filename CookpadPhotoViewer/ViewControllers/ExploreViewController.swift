//
//  ExploreViewController.swift
//  CookpadPhotoViewer
//
//  Created by Rebouh Aymen on 19/04/2017.
//  Copyright © 2017 Aymen. All rights reserved.
//

import UIKit
import GlidingCollection

class ExploreViewController: UIViewController {

    // MARK: - Properties -
    
    @IBOutlet weak var glidingCollection: GlidingCollection!
    var viewModel = ExploreViewModel()
    
    struct MealCellProperties {
        static let identifier = "MealCell"
    }
    
    // MARK: - Lifecycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupGlidingCollection()
    }
    
    // MARK: - User Interface -
    
    private func setupGlidingCollection() {
        glidingCollection.dataSource = self
    
        let nib = UINib(nibName: String(describing: MealCell.self), bundle: nil)
        glidingCollection.collectionView.register(nib, forCellWithReuseIdentifier: MealCellProperties.identifier)
        glidingCollection.collectionView.delegate = self
        glidingCollection.collectionView.dataSource = self
        glidingCollection.collectionView.backgroundColor = glidingCollection.backgroundColor
    }
}

// MARK: - GlidingCollectionDatasource -

extension ExploreViewController: GlidingCollectionDatasource {
    
    func numberOfItems(in collection: GlidingCollection) -> Int {
        return viewModel.sectionsTitles.count
    }
    
    func glidingCollection(_ collection: GlidingCollection, itemAtIndex index: Int) -> String {
        return viewModel.sectionsTitles[index]
    }
}

// MARK: - UICollectionViewDataSource -

extension ExploreViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MealCellProperties.identifier, for: indexPath) as! MealCell

        cell.imageView.image = UIImage(named: "dessertSample")
        cell.setup()

        return cell
    }
}

// MARK: - UICollectionViewDelegate -

extension ExploreViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        let section = glidingCollection.expandedItemIndex
        let item = indexPath.item
        print("#\(item) in section #\(section)")
    }
}
