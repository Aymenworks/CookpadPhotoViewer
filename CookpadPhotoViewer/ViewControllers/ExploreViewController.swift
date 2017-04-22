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
import Hero

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
        
        self.glidingCollection.reloadData()
    }
    
    func fetchData() {
        bindViewModel()
        
        viewModel.getStarters()
        viewModel.getMainCourses()
        viewModel.getDesserts()
    }
    
    private func bindViewModel() {
        Observable.merge([viewModel.starters.asObservable(), viewModel.mainCourses.asObservable(), viewModel.desserts.asObservable()])
            .filter { !$0.isEmpty && self.glidingCollection != nil }
            .subscribe(onNext: { _ in
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
        
        isHeroEnabled = true
        glidingCollection.collectionView.heroModifiers = [.cascade]
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
        return viewModel.numberOfPhotosFor(section: glidingCollection.expandedItemIndex)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MealCellProperties.identifier, for: indexPath) as! MealCell
        let photoTuple = viewModel.photoFor(section: glidingCollection.expandedItemIndex, atIndex: indexPath.row)
        cell.setupWith(model: photoTuple.photo, placeholder: photoTuple.placeholder)
        
        return cell
    }
}

// MARK: - UICollectionViewDelegate -

extension ExploreViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "PhotoDetailViewController") as! PhotoDetailViewController
        let cell = collectionView.cellForItem(at: indexPath) as! MealCell
        vc.selectedIndex = indexPath
        vc.selectedImage = cell.imageView.image
        vc.placeholder = viewModel.placeholderFor(section: glidingCollection.expandedItemIndex)
        vc.photos = viewModel.photosFor(section: glidingCollection.expandedItemIndex)
        self.present(vc, animated: true, completion: nil)
    }
}
