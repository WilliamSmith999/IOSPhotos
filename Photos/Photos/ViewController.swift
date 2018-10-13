//
//  ViewController.swift
//  Photos
//
//  Created by William Smith on 10/12/18.
//  Copyright © 2018 William Smith. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    let imagePicker =  UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func takePhoto(_ sender: Any) {
        if (UIImagePickerController.isSourceTypeAvailable(.camera)){
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        self.present(imagePicker, animated: true, completion: nil)
            
        }else{
            print("there is no camera")
            let alert = UIAlertController(title: "No camera found?", message: "Sorry action aborted", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imagePicker.dismiss(animated: true, completion: nil)
        imageView.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
    }
    @IBAction func imagesLoad(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let imagePicker2 = UIImagePickerController()
            imagePicker2.delegate = self
            imagePicker2.sourceType = .photoLibrary;
            imagePicker2.allowsEditing = true
            self.present(imagePicker2, animated: true, completion: nil)
        }
    }
    
}

