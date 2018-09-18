//
//  LoginViewController.swift
//  MyDream1
//
//  Created by Fisky on 26/08/18.
//  Copyright (c) 2018 Fisky. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol LoginDisplayLogic: class
{
  func displaySomething(viewModel: Login.Something.ViewModel)
}

class LoginViewController: UIViewController, LoginDisplayLogic
{
  var interactor: LoginBusinessLogic?
  var router: (NSObjectProtocol & LoginRoutingLogic & LoginDataPassing)?

    
    @IBOutlet var lblTitleLogin: UILabel!
    @IBOutlet weak var txtFldMobileNumber: UITextField!
    @IBOutlet weak var labelLogo: UILabel!
   // @IBOutlet weak var btnTemp: UIButton!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var viewLoginSV: UIView!
    @IBOutlet  var consLoginSVheight: NSLayoutConstraint!
    @IBOutlet  var consLoginSVX: NSLayoutConstraint!
    
    @IBOutlet var consBtnBackTopContrast: NSLayoutConstraint!
    @IBOutlet  var consBtnBackTopExtend: NSLayoutConstraint!
     @IBOutlet var consLblTitleTopContrast: NSLayoutConstraint!
    @IBOutlet var consLblTitleTopExtand: NSLayoutConstraint!
    // MARK: Object lifecycle
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
  {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder)
  {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: Setup
  
  private func setup()
  {
    let viewController = self
    let interactor = LoginInteractor()
    let presenter = LoginPresenter()
    let router = LoginRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
  
  // MARK: Routing
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
  {
    if let scene = segue.identifier {
      let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
      if let router = router, router.responds(to: selector) {
        router.perform(selector, with: segue)
      }
    }
  }
  
  // MARK: View lifecycle
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
   
    
    doSomething()
  }
  
  // MARK: Do something
  
  //@IBOutlet weak var nameTextField: UITextField!
  
  func doSomething()
  {
    let request = Login.Something.Request()
    interactor?.doSomething(request: request)
  }
  
  func displaySomething(viewModel: Login.Something.ViewModel)
  {
    //nameTextField.text = viewModel.name
  }
    
    // Functions
    
    func expandContract(_ istoContract:Bool)
    {
        
      
        lblTitleLogin.alpha = 0
        txtFldMobileNumber.alpha = 0.5
        UIView.animate(withDuration: 0.8, animations: {
            self.consLoginSVheight.isActive = istoContract
            self.consLoginSVX.isActive = !istoContract
            self.consBtnBackTopContrast.isActive = istoContract
            self.consBtnBackTopExtend.isActive = !istoContract
            self.consLblTitleTopExtand.isActive = !istoContract
            self.consBtnBackTopContrast.isActive = istoContract
            
            
            self.lblTitleLogin.text = istoContract ? "Get Moving With UBER" : "Enter Your Mobile Number"
            self.txtFldMobileNumber.placeholder = istoContract ? "Enter your mobile number" : "9786407671"
            
            self.lblTitleLogin.textColor = istoContract ? UIColor.black : UIColor.gray
            //self.lblTitleLogin.font = istoContract ?
            
            
            
            self.lblTitleLogin.alpha = 1
            self.txtFldMobileNumber.alpha = 1
            self.btnBack.alpha = istoContract ? 0 : 1
            //self.btnTemp.alpha = istoContract ? 1 : 0
            
            self.view.layoutIfNeeded()
        }) { (completed) in
            if(completed)
            {
                
               self.labelLogo.isHidden = !istoContract
                if (!istoContract)
                {
                   // self.txtFldMobileNumber.becomeFirstResponder()
                }
            }
        }

        
        
    }
    
    // Button Actions
    @IBAction func btnTemp(_ sender: UIButton) {
        
     
       
       
    }
    @IBAction func expandView(_ sender: UITextField) {
        
      
    }
    @IBAction func btnBack(_ sender: UIButton) {
        txtFldMobileNumber.resignFirstResponder()
        self.expandContract(true)
    }
    
}

extension LoginViewController : UITextFieldDelegate
{
    
    
   
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.labelLogo.isHidden = true
        self.expandContract(false)
        textField.resignFirstResponder()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
            textField.becomeFirstResponder()
        }
    }
    
    
    
    
}