import UIKit
import Foundation

class LoginViewController: UIViewController {

    @IBOutlet weak var Image: UIImageView!
    @IBOutlet weak var Button: UIButton!
    @IBOutlet weak var mobileNoTextField: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        Button.layer.cornerRadius = 5
    }

    
    @IBAction func reqOPT(_ sender: Any) {
       
        let mobileNumber:String = mobileNoTextField!.text!
        let digits = mobileNumber.filter { $0.isNumber }
        let firstTwoDigits = String(digits.prefix(2))
        let lastTwoDigits = String(digits.suffix(2))
        let otp = firstTwoDigits + lastTwoDigits
      
 
       // Here switch screen with help of instantiateViewController
        
        let con : NewOViewController =  self.storyboard!.instantiateViewController(withIdentifier:  "New") as! NewOViewController
         con.viewCon = self
         con.OTP = otp
         self.present(con, animated: true, completion: nil)
     
    }
    
       //  With the help of segue we can switch screen
    
        /*
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if(segue.identifier == "Com"){
         let addCom: OTPViewController = segue.destination as! OTPViewController
         addCom.viewCon = self
         }
        }*/
   
    @IBAction func backAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
