//
//  ViewController.swift
//  Tags
//
//  Created by Ömer Oğuz Çelikel on 24.08.2022.
//

import UIKit

class ViewController: UIViewController {
    var tagsArray = ["appleappleapple", "pen", "book", "phone", "vs", "asdasd", "asdas", "asdphone", "asd"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var xPos:CGFloat = 20.0
        var ypos: CGFloat = 130.0
        var tag: Int = 1
        
        for str in tagsArray  {
            let width = str.count * 10
            let checkWholeWidth = CGFloat(xPos) + CGFloat(width) + CGFloat(13.0) + CGFloat(25.5)//13.0 is the width between lable and cross button and 25.5 is cross button width and gap to right
            if checkWholeWidth > UIScreen.main.bounds.size.width - 20.0 {
                //we are exceeding size need to change xpos
                xPos = 15.0
                ypos = ypos + 29.0 + 8.0
            }
            
            let bgView = UIView(frame: CGRect(x: xPos, y: ypos, width:CGFloat(width) + 17.0 + 38.5 , height: 29.0))
            bgView.layer.cornerRadius = 14.5
            bgView.backgroundColor = UIColor(red: 33.0/255.0, green: 135.0/255.0, blue:199.0/255.0, alpha: 1.0)
            bgView.tag = tag
            
            let textlable = UILabel(frame: CGRect(x: 17.0, y: 0.0, width: CGFloat(width), height: bgView.frame.size.height))
            textlable.text = str
            textlable.textColor = UIColor.white
            bgView.addSubview(textlable)
            
            let button = UIButton(type: .custom)
            button.frame = CGRect(x: bgView.frame.size.width - 2.5 - 23.0, y: 3.0, width: 23.0, height: 23.0)
            button.backgroundColor = UIColor.white
            button.layer.cornerRadius = CGFloat(button.frame.size.width)/CGFloat(2.0)
            button.setImage(UIImage(named: "CrossWithout"), for: .normal)
            button.tag = tag
            //button.addTarget(self, action: #selector(removeTag), for: .touchUpInside)
            bgView.addSubview(button)
            
            xPos = CGFloat(xPos) + CGFloat(width) + CGFloat(17.0) + CGFloat(43.0)
            view.addSubview(bgView)
            tag = tag  + 1
        }
        
        
    }
//    @objc func removeTag(_ sender: AnyObject) {
//            tagsArray.remove(at: (sender.tag - 1))
//            createTagCloud(OnView: self.view, withArray: tagsArray as [AnyObject])
//        }
}
