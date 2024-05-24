import UIKit

class NewOViewController: UIViewController {

    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var Button: UIButton!
    
    @IBOutlet weak var A: UITextField!
    @IBOutlet weak var B: UITextField!
    @IBOutlet weak var C: UITextField!
    @IBOutlet weak var D: UITextField!
    
    var viewCon:LoginViewController?
    var OTP:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Button.layer.cornerRadius = 5
        
        phoneLabel!.text = viewCon!.mobileNoTextField!.text!
    }
    
    override func viewDidAppear(_ animated: Bool) {
     
            var alertCon:UIAlertController = UIAlertController(title: "Your confirmation code is below — enter it  and we'll help you get signed in.", message: "OTP:\(self.OTP!)", preferredStyle: UIAlertController.Style.alert)
            
            var cancelAction:UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
            
            alertCon.addAction(cancelAction)
            self.present(alertCon, animated: true, completion: nil)
    
    }
    
    
    @IBAction func submitAction(_ sender: Any) {
      
        let s1:String = String(A!.text!)
        let s2:String = String(B!.text!)
        let s3:String = String(C!.text!)
        let s4:String = String(D!.text!)
        let str:String = s1 + s2 + s3 + s4

        if(str == OTP!){
            let con:CreateProfileViewController = self.storyboard?.instantiateViewController(withIdentifier: "create") as! CreateProfileViewController
            self.present(con, animated: true, completion: nil)
        }
    }
    
    // Create backAction funcation for to go back
    
    @IBAction func backAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

