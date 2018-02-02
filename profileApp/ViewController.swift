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
    var gender = 0
    var dateT = "date"
    var datepickerSelect = 0
    
    @IBOutlet weak var viefField: UIView!
    @IBOutlet weak var coverPic: UIImageView!
    
    @IBOutlet weak var profilePic: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker?.delegate = self
        nameTf.delegate = self
        addTf.delegate = self
        emailTf.delegate = self
        let tap = UITapGestureRecognizer(target: self, action: Selector (("textFieldDidEndEditing:")))
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
        gender = 1
        
        
        
        
    }
    @IBAction func femaleBtn(_ sender: UIButton) {
        fBtn.backgroundColor = UIColor.black
        mBtn.backgroundColor = UIColor.white
        gender = 2
    }
    
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        
        datepickerSelect = 1
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = DateFormatter.Style.short
     //   dateFormatter.timeStyle = DateFormatter.Style.short
        
        let strDate = dateFormatter.string(from: dateP.date)
     
        dateT = strDate as String
    
    }
    
    @IBAction func submitButton(_ sender: UIButton) {
        if (nameTf.text?.isEmpty)!{
            let alert = UIAlertController(title:  "Missing", message: "Please Enter Customer Name.", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style:.default, handler: nil)
            alert.addAction(ok)
            present(alert, animated: true, completion: nil)
          
        }
        else if(addTf.text?.isEmpty)!{
            let alert = UIAlertController(title:  "Missing", message: "Please Enter Address.", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style:.default, handler: nil)
            alert.addAction(ok)
            present(alert, animated: true, completion: nil)
            
        }
        else if(emailTf.text?.isEmpty)!{
            let alert = UIAlertController(title:  "Missing", message: "Please Enter Email Id.", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style:.default, handler: nil)
            alert.addAction(ok)
            present(alert, animated: true, completion: nil)
        }
        else if(dateT == "date"){
            let alert = UIAlertController(title:  "Missing", message: "Please Select Date of Birth.", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style:.default, handler: nil)
            alert.addAction(ok)
            present(alert, animated: true, completion: nil)
        }
        else if(contactTf.text?.isEmpty)!{
            let alert = UIAlertController(title:  "Missing", message: "Please Enter Contact.", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style:.default, handler: nil)
            alert.addAction(ok)
            present(alert, animated: true, completion: nil)
            
        }
            
        else if(gender == 0){
            let alert = UIAlertController(title:  "Missing", message: "Please Select Gender.", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style:.default, handler: nil)
            alert.addAction(ok)
            present(alert, animated: true, completion: nil)
        }
        else
        {
        
        
        let name = nameTf.text
        let address = addTf.text
        let email = emailTf.text
    
        let contact = contactTf.text
        print("Name : ",name!)
        print("Address : ",address!)
        print("Email : ",email!)
       print("Date : ",dateT)
        
        print("Contact : ",contact!)
        if (gender == 1){
            print("Gender : Male")}
        else if(gender == 2)
        { print("Gender : Female")}
        
    }
    }
    
    
}

