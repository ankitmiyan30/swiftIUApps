//
//  AllStoryTableViewCell.swift
//  Instagram
//
//  Created by Anthony Ankit on 18/09/20.
//  Copyright © 2020 Anthony Ankit. All rights reserved.
//

import UIKit

class AllStoryTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    static let identifier = "AllStoryTableViewCell"
    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()

        let nib = UINib(nibName: StoryCollectionViewCell.identifier, bundle: nil)
        collectionView?.register(nib, forCellWithReuseIdentifier: StoryCollectionViewCell.identifier)
        collectionView?.dataSource = self
        collectionView?.delegate = self
        collectionView?.backgroundColor = .white
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryCollectionViewCell.identifier, for: indexPath) as! StoryCollectionViewCell
        cell.addStroyButton.isHidden = true
        InstagramHelper.gredientBorderRadius(imageView: cell.imageView)
        if(indexPath.row == 0){
            cell.userName.text = "My Story"
            cell.addStroyButton.isHidden = false
        }
        return cell
    }
}
