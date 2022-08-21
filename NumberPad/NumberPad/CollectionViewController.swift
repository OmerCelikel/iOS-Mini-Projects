//
//  CollectionViewController.swift
//  NumberPad
//
//  Created by Ömer Oğuz Çelikel on 15.08.2022.
//

import UIKit

//private let reuseIdentifier = "Cell"
class KeyCell: UICollectionViewCell{
    let digitsLabel = UILabel()
    let letterLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(white: 0.9, alpha: 1)
        
        digitsLabel.text = "8"
        digitsLabel.font = UIFont.systemFont(ofSize: 32)
        
        letterLabel.text = "A B C"
        letterLabel.font = UIFont.boldSystemFont(ofSize: 10)
        
        let stackView = UIStackView(arrangedSubviews: [digitsLabel, letterLabel])
        stackView.axis = .vertical
        
        addSubview(stackView)
        //stackView.fillSuperView()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = self.frame.width / 2
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    fileprivate let cellId = "cellId"
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .gray
        collectionView.register(KeyCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 7
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! KeyCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // % 15 of the screen
        let leftRightPadding = view.frame.width * 0.13
        // % 10 of the screen
        let interSpacing = view.frame.width * 0.1
        
        let cellWidth = (view.frame.width - 2 * leftRightPadding -  2 * interSpacing ) / 3
        return .init(width: cellWidth, height: cellWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        // % 15 of the screen
        let leftRightPadding = view.frame.width * 0.15
        // % 10 of the screen
        //let interSpacing = view.frame.width * 0.1
        return .init(top: 16, left: leftRightPadding, bottom: 16, right: leftRightPadding)
    }
    
}
