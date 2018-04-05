//
//  ImageViewController.swift
//  Coding Challenge
//
//  Created by Ricardo Duarte on 2018-04-04.
//  Copyright © 2018 KhromosTech. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var labelToBeChanged: UILabel!
    
    var username = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Instantiate tapGesture
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ImageViewController.imageTapped(gesture:)))
        //Add tag gesture to the image
        self.image.addGestureRecognizer(tapGesture)
        self.image.isUserInteractionEnabled = true
        self.labelToBeChanged.isHidden = true
        print(username)
    }
    
    //image tapped function
    @objc func imageTapped(gesture: UIGestureRecognizer) {
        
        if let image = gesture.view as? UIImageView {
            print("Image Tapped")
            self.AlertMessage(titleText: "", messageText: "Hello \(self.username)")
            self.labelToBeChanged.text = "Hello \(self.username)"
            self.labelToBeChanged.isHidden = false
        }
    }
    
    //Alert
    func AlertMessage(titleText: String, messageText: String?){
        let alert = UIAlertController(title: titleText, message: messageText, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
