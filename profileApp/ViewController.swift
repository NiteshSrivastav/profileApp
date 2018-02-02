//
//  ViewController.swift
//  profileApp
//
//  Created by Nitesh Srivastva on 23/01/18.
//  Copyright © 2018 Nitesh Srivastva. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITextFieldDelegate {

    @IBOutlet weak var mBtn: UIButton!
    
    @IBOutlet weak var fBtn: UIButton!
    
    @IBOutlet weak var nameTf: UITextField!
    
    @IBOutlet weak var addTf: UITextField!
    
    @IBOutlet weak var emailTf: UITextField!
    
    @IBOutlet weak var dateP: UIDatePicker!
    @IBOutlet weak var submitBtn: UIButton!
    
    @IBOutlet weak var contactTf: UITextField!
    var picker : UIImagePickerController? = UIImagePickerController()
    var flag = 0
    
    @IBOutlet weak var viefField: UIView!
    @IBOutlet weak var coverPic: UIImageView!
    
    @IBOutlet weak var profilePic: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker?.delegate = self
        nameTf.delegate = self
        addTf.delegate = self
        emailTf.delegate = self
        let tap = UITapGestureRecognizer(target: self, action:Selector (("textFieldDidEndEditing:")))
        self.viefField.addGestureRecognizer(tap)
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    var activeField : UITextField?
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        activeField = textField
        activeField?.becomeFirstResponder()
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        activeField?.resignFirstResponder()
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func ppbtnClicked(_ sender: UIButton) {
        flag = 1
        openGallery()
        
    }
    
    @IBAction func cpbtnClicked(_ sender: UIButton) {
        flag = 2
        openGallery()
        
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let chooseImage = info[UIImagePickerControllerOriginalImage] as? UIImage
        coverPic.contentMode = .scaleToFill
        if (flag == 1){
             profilePic.image = chooseImage
        }
        else if(flag == 2){
            coverPic.image = chooseImage
        }
        
       
        dismiss(animated: true, completion: nil)
        
    }
    func openGallery() {
        picker?.allowsEditing = false
        picker?.sourceType = UIImagePickerControllerSourceType.photoLibrary
        present(picker!, animated: true, completion: nil)
        
    }
    
    @IBAction func maleBtn(_ sender: UIButton) {
        
            mBtn.backgroundColor = UIColor.black
           fBtn.backgroundColor = UIColor.white
        
        
        
        
    }
    @IBAction func femaleBtn(_ sender: UIButton) {
        fBtn.backgroundColor = UIColor.black
        mBtn.backgroundColor = UIColor.white
    }
    
    @IBAction func submitButton(_ sender: UIButton) {
        let name = nameTf.text
        print(name!)
        print("Address ",addTf.text as! Any)
        print("Email ",emailTf.text as Any)
        
    }
    
    
}

