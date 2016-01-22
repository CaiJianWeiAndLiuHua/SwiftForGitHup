
import UIKit
class HomeViewController: BaseViewController {

    private let tagIndexOne  = 100

    private let tagIndexTwo  = 200

    private let tagIndexThree = 300





    var dicJson:NSDictionary! {

        didSet {

            if  ("link" as NSString).isEqualToString(dicJson[ACTION.pagetype] as! String ){

                self.performSegueWithIdentifier("mainWebViewController", sender: nil);
                //                print("aciton index \(index)")
            }



        }


    }
//主界面切换
    lazy var bottomView:BottomViewTouch = {

        var bottom = BottomViewTouch.initWithFrameView(CGRect(x: 0, y: Mobile.height - 50 * Mobile.ratio , width: Mobile.width, height: 50 * Mobile.ratio))
        bottom.bottomTagIndex = {



           (indexTouch)  in

            self.home.removeFromSuperview()
            self.enrollView.removeFromSuperview()

            switch indexTouch {

            case  100 :

                self.view.addSubview(self.home)

                break

            case  200 :
                 self.view.addSubview(self.enrollView)
                break

            case  300:

                break

            default:

                break

            }





        }

        return bottom
    }()



    
    lazy var leftButton:UIButton = {

        let buttonRight = UIButton(frame: CGRect(x: 20, y: 20, width: 44, height: 30))

//        buttonRight.frame = CGRectOffset(buttonRight.frame, -20, 40)

        buttonRight.rac_command = RACCommand(signalBlock: { (buttonRight) -> RACSignal! in

            print("print to going ......")

            return RACSignal.empty()


        })
        buttonRight.setTitle("left", forState: .Normal)
        return buttonRight
    }()


    lazy var rightButton:UIButton = {

        let buttonRight = UIButton(frame: CGRect(x: Mobile.width - 70, y: 20, width: 44, height: 30))

        buttonRight.rac_command = RACCommand(signalBlock: { (buttonRight) -> RACSignal! in

            print("print to going ...... left")

            return RACSignal.empty()


        })
        buttonRight.setTitle("杭州", forState: .Normal)
        return buttonRight
    }()

// 第一个主页面
    lazy var home:HomeView = {

        var homeV = HomeView(frame:CGRect(x: 0, y: 64, width: Mobile.width, height: Mobile.height - 64 - 50))

        homeV.backgroundColor = RGBA(240,240,240,1)
        homeV.requestHttpDataView()
        homeV.didSelectAction = {
         (dicJ) in
            
            self.dicJson = dicJ
            

            
            
           
            
          
        
        }

        return homeV



    }()
    
//    第二个主界面
    
    lazy var enrollView:EnrollViewTableView = {
    
       
        var enroll = EnrollViewTableView(frame:CGRect(x: 0, y: 64, width: Mobile.width, height: Mobile.height - 64 - 50 * Mobile.ratio))
        
          enroll.startRequest()
        
        enroll.backgroundColor = RGBA(255,1,1,1)
        enroll.enrollDidSelectRow = {
            (dicValue) in

          self.dicJson = dicValue



        }
        return enroll
    
    
    
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



    override func viewDidLoad() {
        
        super.viewDidLoad()
//        self.edgesForExtendedLayout = .None
        navLable.removeFromSuperview()
        view.addSubview(navXueCheImage)
        view.addSubview(home)
        view.addSubview(rightButton)
        view.addSubview(leftButton)

        view.addSubview(bottomView)

        
    }
    
}
