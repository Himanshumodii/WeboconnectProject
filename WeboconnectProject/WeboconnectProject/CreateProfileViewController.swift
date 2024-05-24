import UIKit

class CreateProfileViewController: UIViewController {

    
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var lastNameText: UITextField!
    @IBOutlet weak var phoneText: UITextField!
    @IBOutlet weak var postCodeText: UITextField!
    
    @IBOutlet weak var locationButton: UIButton!
    @IBOutlet weak var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationButton.layer.cornerRadius = 5
        submitButton.layer.cornerRadius = 5
        
    }


    @IBAction func submitAction(_ sender: Any) {
  
        var doctorData:[String:Any] = [:]
        doctorData["name"] = nameText!.text!
        doctorData["email"] = lastNameText!.text!
        doctorData["phoneNumber"] = phoneText!.text!
        doctorData["password"] = postCodeText!.text!
        
        
        // convert dictionary into JSON format
        do{
            let jsonData:Data = try JSONSerialization.data(withJSONObject: doctorData, options: JSONSerialization.WritingOptions.prettyPrinted)
            
            var str:String = "http://tutorials.codebetter.in:3000/auth/doctor/save"
            var myUrl = URL(string: str)!
            var urlReq = URLRequest(url: myUrl)
            urlReq.httpMethod = "POST"
            urlReq.httpBody = jsonData
            urlReq.addValue("application/json", forHTTPHeaderField: "Content-Type")
            urlReq.addValue("\(jsonData.count)", forHTTPHeaderField: "Content-Length")
            
            var urlSession = URLSession.shared
            // let dataTask:URLSessionDataTask = URLSession.shared.dataTask(with: request)
            
            let dataTask:URLSessionDataTask = urlSession.dataTask(with: urlReq)
            {
                
                (urlData:Data?, response:URLResponse?, err:Error?)
                in
                do{
                var json:[String:Any]  = try JSONSerialization.jsonObject(with: urlData!, options: JSONSerialization.ReadingOptions.mutableLeaves) as! [String : Any]
                    
                    print(json)
                    
                    if( (json["status"] as! Bool) == true){
                        print(json["msg"] as! String)
                        DispatchQueue.main.async{
                            self.dismiss(animated: true)
                        }
                    }else{
                        print("registration failed :", json["msg"] as! String)
                    }
                }
                catch{
                    print("json response parsing error ", error)
                }
               // print(err)
            }
            dataTask.resume()
        }catch{
            print("JSON conversion error ", error)
        }
        
    }
    
    @IBAction func backAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
