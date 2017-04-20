//
//  ExploreViewController.swift
//  CookpadPhotoViewer
//
//  Created by Rebouh Aymen on 19/04/2017.
//  Copyright © 2017 Aymen. All rights reserved.
//

import UIKit
import GlidingCollection
import Alamofire
import RxSwift
import RxCocoa
import Haneke

class ExploreViewController: UIViewController {

    // MARK: - Properties -
    
    @IBOutlet weak var glidingCollection: GlidingCollection!
    var viewModel: ExploreViewModel!
    let disposeBag = DisposeBag()
    
    struct MealCellProperties {
        static let identifier = "MealCell"
    }
    
    // MARK: - Lifecycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupGlidingCollection()
        bindViewModel()
        
        viewModel.getStarters()
        viewModel.getMainCourses()
        viewModel.getDesserts()
    }
    
    private func bindViewModel() {
        Observable.merge([viewModel.starters.asObservable(), viewModel.mainCourses.asObservable(), viewModel.desserts.asObservable()])
            .filter { !$0.isEmpty }
            .subscribe(onNext: { _ in
                print("reload")
                self.glidingCollection.reloadData()
            }).addDisposableTo(disposeBag)
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
        switch glidingCollection.expandedItemIndex {
        case 0: return viewModel.starters.value.count
        case 1: return viewModel.mainCourses.value.count
        case 2: return viewModel.desserts.value.count
        default: return 0
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MealCellProperties.identifier, for: indexPath) as! MealCell
        cell.setup()

        let photo = viewModel.photoUrlFor(section: glidingCollection.expandedItemIndex, atIndex: indexPath.row)
        
        if let url = URL(string: photo.url) {
            cell.imageView.hnk_setImageFromURL(url, placeholder: photo.placeholder)
        }
        
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
