//
//  PhotoDetailViewController.swift
//  CookpadPhotoViewer
//
//  Created by Rebouh Aymen on 21/04/2017.
//  Copyright © 2017 Aymen. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class PhotoDetailViewController: UIViewController {
    
    // MARK: - Properties -
    
    var placeholder: UIImage!
    var photos: [Photo] = []
    var selectedIndex: IndexPath!
    var selectedImage: UIImage!
    let disposeBag = DisposeBag()
    
    struct PhotoDetailCellInformations {
        static let identifier = "PhotoDetailCell"
    }
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            let nib = UINib(nibName: String(describing: PhotoDetailCell.self), bundle: nil)
            collectionView.register(nib, forCellWithReuseIdentifier: PhotoDetailCellInformations.identifier)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bindView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        collectionView.scrollToItem(at: selectedIndex, at: .centeredHorizontally, animated: false)
    }
    
    private func bindView() {
        Observable<[Photo]>.just(photos)
            .bind(to: collectionView.rx.items(cellIdentifier: PhotoDetailCellInformations.identifier, cellType: PhotoDetailCell.self)) { index, photo, cell in
                cell.setupWith(photo: photo, placeholder: self.selectedIndex.row == index ? self.selectedImage : self.placeholder)
            }.addDisposableTo(disposeBag)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout -

extension PhotoDetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return view.bounds.size
    }
}
