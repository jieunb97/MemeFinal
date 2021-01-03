//
//  MemeImage.swift
//  Meme2.0
//
//  Created by Jieun Bae on 1/1/21.
//

import Foundation
import UIKit

extension MemeViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
       

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageMeme.image = image
            buttonShare.isEnabled = true
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    
    func openImagePicker(_ picker: UIImagePickerController, _ type: UIImagePickerController.SourceType){
        picker.sourceType = type
        present(picker, animated: true, completion: nil)
    }
    
}
