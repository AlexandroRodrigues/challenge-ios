//
//  ViewController.swift
//  Pizza
//
//  Created by Alexandro Rodrigues on 18/06/21.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {

    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    
    let controller = LoginController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name:UIResponder.keyboardWillShowNotification, object: nil);
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name:UIResponder.keyboardWillHideNotification, object: nil);

    }
    
    func setupUI() {
        btnLogin.layer.cornerRadius = 10
    }

    @IBAction func btnLogin(_ sender: UIButton) {
        controller.loginRequest(email: userTextField.text ?? "", password: passwordTextField.text ?? "") { [weak self] success in
            if success {
                self?.goToPizzaScreen()
            } else {
                self?.showAlertError()
            }
        }
    }
    
    
    func goToPizzaScreen() {
        if let vc = self.storyboard?.instantiateViewController(identifier: controller.navPizzaViewController) {
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    func showAlertError() {
        let alert = UIAlertController(title: controller.errorTitle, message: controller.errorMessage, preferredStyle: .alert)
        let btnOk = UIAlertAction(title: controller.btnErrorOK, style: .default, handler: nil)
        alert.addAction(btnOk)
        self.present(alert, animated: true, completion: nil)

    }
    
    
    @objc func keyboardWillShow(sender: NSNotification) {
         self.view.frame.origin.y = -150
    }

    @objc func keyboardWillHide(sender: NSNotification) {
         self.view.frame.origin.y = 0
    }
    
}

