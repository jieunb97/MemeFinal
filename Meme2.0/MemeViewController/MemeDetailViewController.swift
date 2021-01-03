//
//  MemeDetailViewController.swift
//  Meme2.0
//
//  Created by Jieun Bae on 1/1/21.
//

import UIKit

class MemeDetailViewController: UIViewController {
      
    var memedImage: UIImage!
        
    @IBOutlet weak var imageMeme: UIImageView!
        
    override func viewWillAppear(_ animated: Bool) {
        imageMeme.image = memedImage
    }
    
}
