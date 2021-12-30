//
//  ViewController.swift
//  ImagePicker
//
//  Created by Anthony.Ankit on 03/03/21.
//
import UIKit


class ViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var chooseBuuton: UIButton!
    
    
    @IBAction func btnClicked() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary){
            print("Button capture")
            let imag = UIImagePickerController()
            imag.delegate = self
            imag.sourceType = UIImagePickerController.SourceType.photoLibrary;
            //imag.mediaTypes = [kUTTypeImage];
            imag.allowsEditing = false
            self.present(imag, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo image: UIImage!, info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = image
    }
//    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!) {
//        let selectedImage : UIImage = image
//        //var tempImage:UIImage = editingInfo[UIImagePickerControllerOriginalImage] as UIImage
//        imageView.image=selectedImage
//        self.dismiss(animated: true, completion: nil)
//    }
    
}
