//
//  MemeViewController.swift
//  Meme2.0
//
//  Created by Jieun Bae on 1/1/21.
//

import UIKit

class MemeViewController: UIViewController {
        
    struct Constants {
        static let TopStartText = "TOP"
        static let BottomStartText = "BOTTOM"
    }
        
    @IBOutlet weak var topToolbar: UIToolbar!
    @IBOutlet weak var bottomToolbar: UIToolbar!
    @IBOutlet weak var imageMeme: UIImageView!
    @IBOutlet weak var textTop: UITextField!
    @IBOutlet weak var textBottom: UITextField!
    @IBOutlet weak var buttonCamera: UIBarButtonItem!
    @IBOutlet weak var buttonShare: UIBarButtonItem!
    @IBOutlet weak var buttonCancel: UIBarButtonItem!
    
    let picker = UIImagePickerController()
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setViewControlsToInitialState()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        unsubscribeFromKeyboardNotifications()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        picker.delegate = self
        
        buttonCamera.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
        
        setupTextFieldInitialProperties(toTextField: textTop)
        setupTextFieldInitialProperties(toTextField: textBottom)
        
        subscribeToKeyboardNotifications()
    }
        
    @IBAction func pickAnImageFromAlbumAction(_ sender: Any) {
        openImagePicker(picker, .photoLibrary)
    }

    @IBAction func pickAnImageFromCameraAction(_ sender: Any) {
        openImagePicker(picker, .camera)
    }
        
    @IBAction func shareImageAction(_ sender: Any) {
        shareImage()
    }
    
    @IBAction func cancelAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func setViewControlsToInitialState() {
        imageMeme.image = nil
        buttonShare.isEnabled = false
        textTop.text = Constants.TopStartText
        textBottom.text = Constants.BottomStartText
    }
    
}
