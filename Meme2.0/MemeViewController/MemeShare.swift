//
//  MemeShare.swift
//  Meme2.0
//
//  Created by Jieun Bae on 1/1/21.
//

import Foundation
import UIKit

extension MemeViewController {
    
    
    func save(image: UIImage) {
       
        let meme = Meme(topText: textTop.text!, bottomText: textBottom.text!, originalImage: imageMeme.image!, memedImage: image)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.memes.append(meme)
    }
    
    
    func changeToolbarsHiddenState(_ hidden: Bool) {
        topToolbar.isHidden = hidden
        bottomToolbar.isHidden = hidden
    }
    
    func generateMemedImage() -> UIImage {
        changeToolbarsHiddenState(true)
        
        UIGraphicsBeginImageContext(self.view.frame.size)
        view.drawHierarchy(in: self.view.frame, afterScreenUpdates: true)
        let memedImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        changeToolbarsHiddenState(false)
        
        return memedImage
    }
    
    func shareImage() {
        let memedImage = generateMemedImage()
        let activityViewController = UIActivityViewController(activityItems: [memedImage], applicationActivities: nil)
        activityViewController.completionWithItemsHandler = { activityType, completed, returnedItems, error -> () in
            if completed {
                self.save(image: memedImage)
                activityViewController.dismiss(animated: true, completion: nil)
                self.dismiss(animated: true, completion: nil)
            }
        }
        self.present(activityViewController, animated: true, completion: nil)
    }
    
}
