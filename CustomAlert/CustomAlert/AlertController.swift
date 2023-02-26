//
//  AlertController.swift
//  CustomAlert
//
//  Created by Ömer Oğuz Çelikel on 26.02.2023.
//

import Foundation
import UIKit
protocol CustomAlertDelegate: AnyObject {
    func customAlertDidTapButton(at index: Int)
}

class CustomAlert {
    
    static let shared = CustomAlert()
    private init() {}
    
    weak var delegate: CustomAlertDelegate?
    
    func showAlert(in viewController: UIViewController, photo: UIImage?, title: String?, message: String?, numberOfButtons: Int, buttonTitles: [String]) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        if let photo = photo {
                let imageView = UIImageView(image: photo)
                imageView.contentMode = .scaleAspectFit
                let imageSize = CGSize(width: 135, height: 50)
                imageView.frame = CGRect(x: (alert.view.bounds.width - imageSize.width) / 2, y: 40, width: imageSize.width, height: imageSize.height)
                alert.view.addSubview(imageView)
            }
        
        for index in 0..<numberOfButtons {
            let action = UIAlertAction(title: buttonTitles[index], style: .default) { (_) in
                self.delegate?.customAlertDidTapButton(at: index)
            }
            alert.addAction(action)
        }
        
        viewController.present(alert, animated: true, completion: nil)
    }
}
