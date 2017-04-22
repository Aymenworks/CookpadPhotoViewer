//
//  PhotoDetailViewController.swift
//  CookpadPhotoViewer
//
//  Created by Rebouh Aymen on 21/04/2017.
//  Copyright © 2017 Aymen. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    
    // MARK: - Properties -
    
    var placeholder: UIImage!
    var photos: [Photo] = []
    var selectedIndex: IndexPath!
    var selectedImage: UIImage!

    struct PhotoDetailCellInformations {
        static let identifier = "PhotoDetailCell"
    }
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            let nib = UINib(nibName: String(describing: PhotoDetailCell.self), bundle: nil)
            collectionView.dataSource = self
            collectionView.register(nib, forCellWithReuseIdentifier: PhotoDetailCellInformations.identifier)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        collectionView.scrollToItem(at: selectedIndex, at: .centeredHorizontally, animated: true)
    }
}

// MARK: - UICollectionViewDataSource -

extension PhotoDetailViewController: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoDetailCellInformations.identifier, for: indexPath) as! PhotoDetailCell
        
        if selectedIndex == indexPath {
            cell.setupWith(photo: photos[indexPath.row], placeholder: selectedImage)
        } else {
            cell.setupWith(photo: photos[indexPath.row], placeholder: placeholder)
        }
        return cell

    }
}

// MARK: - UICollectionViewDelegateFlowLayout -

extension PhotoDetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return view.bounds.size
    }
}
