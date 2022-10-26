//
//  myTaskViewController.swift
//  slideGalary
//
//  Created by Ömer Oğuz Çelikel on 9.09.2022.
//

import UIKit

class myTaskViewController: UIViewController {
    @IBOutlet weak var sliderCollectionView: UICollectionView!
    @IBOutlet weak var pageView: UIPageControl!
    var imgArr = [
        UIImage(named:"Angelina Jolie") ,
        UIImage(named:"Emma Stone") ,
        UIImage(named:"Jennifer Lawrence") ,
    ]
    
       var timer = Timer()
       var counter = 0
       
       override func viewDidLoad() {
           super.viewDidLoad()
           
       }




   }


