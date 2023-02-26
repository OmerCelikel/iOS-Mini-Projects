//
//  CustomSpinner.swift
//  CustomSpinner
//
//  Created by Ömer Oğuz Çelikel on 27.02.2023.
//
import UIKit

class CustomSpinner {
    static let shared = CustomSpinner()
    
    private let spinnerView = UIView()
    private let spinner = UIActivityIndicatorView(style: .large)
    
    private init() {
        spinnerView.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        spinnerView.layer.cornerRadius = 10
        
        spinner.color = .white
        spinner.hidesWhenStopped = true
        
        spinnerView.addSubview(spinner)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        
        spinner.centerXAnchor.constraint(equalTo: spinnerView.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: spinnerView.centerYAnchor).isActive = true
    }
    
    func showSpinner(on view: UIView) {
        DispatchQueue.main.async {
            self.spinner.startAnimating()
            let backgroundView = UIView(frame: view.bounds)
            backgroundView.backgroundColor = UIColor.black.withAlphaComponent(0.7)
            backgroundView.tag = 123 // Use a unique tag to identify the background view
            
            view.addSubview(backgroundView)
            view.addSubview(self.spinnerView)
            self.spinnerView.translatesAutoresizingMaskIntoConstraints = false
            self.spinnerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            self.spinnerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
            self.spinnerView.widthAnchor.constraint(equalToConstant: 80).isActive = true
            self.spinnerView.heightAnchor.constraint(equalToConstant: 80).isActive = true
            view.bringSubviewToFront(self.spinnerView)
            view.isUserInteractionEnabled = false
            
        }
    }
    
    func removeSpinner(on view: UIView) {
        DispatchQueue.main.async {
            if let backgroundView = self.spinnerView.superview?.viewWithTag(123) {
                backgroundView.removeFromSuperview()
            }
            self.spinner.stopAnimating()
            self.spinnerView.removeFromSuperview()
            view.isUserInteractionEnabled = true
//            if let view = self.spinnerView.superview {
//                view.isUserInteractionEnabled = true
//            }
        }
    }
}
