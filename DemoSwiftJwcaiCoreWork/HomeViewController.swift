
import UIKit
class HomeViewController: BaseViewController {
    
    var dicJson:NSDictionary?
    
    lazy var rightButton:UIButton = {

        let buttonRight = UIButton(frame: CGRect(x: 20, y: 20, width: 44, height: 30))

        buttonRight.rac_command = RACCommand(signalBlock: { (buttonRight) -> RACSignal! in

            print("print to going ......")

            return RACSignal.empty()


        })
        buttonRight.setTitle("Left", forState: .Normal)
        return buttonRight
    }()


    lazy var leftButton:UIButton = {

        let buttonRight = UIButton(frame: CGRect(x: Mobile.width - 70, y: 20, width: 44, height: 30))

        buttonRight.rac_command = RACCommand(signalBlock: { (buttonRight) -> RACSignal! in

            print("print to going ...... left")

            return RACSignal.empty()


        })
        buttonRight.setTitle("Right", forState: .Normal)
        return buttonRight
    }()


    lazy var home:HomeView = {

        var homeV = HomeView(frame:CGRect(x: 0, y: 64, width: Mobile.width, height: Mobile.height - 64 - 50))

        homeV.backgroundColor = UIColor.purpleColor()
        homeV.requestHttpDataView()
        homeV.didSelectAction = {
         (dicJ) in
            
            self.dicJson = (dicJ as! NSDictionary)
            
            self.performSegueWithIdentifier("mainWebViewController", sender: nil);
            print("aciton index \(index)")
            
          
        
        }

        return homeV



    }()
    lazy var navXueCheImage:UIImageView = {


        var navImage = UIImageView(frame: CGRectMake(Mobile.width/2 - 30.0 , 40, 60, 15))
        navImage.image = UIImage(named: "xuechetitleimage")


        return navImage



    }()


    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.destinationViewController.isKindOfClass(BaseWebViewController.classForCoder()) ){
        
            (segue.destinationViewController as! BaseWebViewController).urlDiction = self.dicJson
            
        }
        
        
        
    }


    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {

        self.view .endEditing(true)
        
    }


    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        navLable.removeFromSuperview()
        view.addSubview(navXueCheImage)
        view.addSubview(home)
        view.addSubview(rightButton)
        view.addSubview(leftButton)
        
    }
    
}
