//
//  LinkItemTableViewCell.swift
//  SaveLinks
//
//  Created by Ömer Oğuz Çelikel on 1.11.2023.
//

import UIKit

class LinkItemTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameTextLabel: UILabel!
    @IBOutlet weak var urlTextLabel: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func configure(with linkItem: LinkItem) {
        nameTextLabel.text = linkItem.name
        urlTextLabel.text = linkItem.url?.absoluteString
        itemImageView.image = linkItem.image
    }
}
