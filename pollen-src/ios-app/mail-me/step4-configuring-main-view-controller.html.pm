#lang pollen

◊headline{Step 4—Configuring main view controller}

◊(steps
  ◊step{Open the ◊code{Main.storyboard} file with assistant editor showing the ◊code{ViewController.swift}. Connect the UITextField.}
  ◊step{Link the UITextFields into the ◊code{ViewController.swift} as ◊code{toText} and ◊code{fromText}. Please also link the UIButton as ◊code{done} IBAction.}
  ◊step{The ◊code{ViewController.swift} should become the following:
    ◊swift{
      import UIKit

      class ViewController: UIViewController, UITextFieldDelegate {

        @IBOutlet weak var toText: UITextField!
        @IBOutlet weak var fromText: UITextField!

        override func viewDidLoad() {
          super.viewDidLoad()
          // Do any additional setup after loading the view, typically from a nib.

          let (to, from) = EmailSetting.sharedSetting.load()
          toText.text = to
          fromText.text = from
        }

        override func didReceiveMemoryWarning() {
          super.didReceiveMemoryWarning()
          // Dispose of any resources that can be recreated.
        }

        @IBAction func done(sender: AnyObject) {
          toText.resignFirstResponder()
          fromText.resignFirstResponder()

          EmailSetting.sharedSetting.save(toText.text, fromEmail: fromText.text)
        }
      }
    }
  }
)

◊section{What just happened?}

We just linked the UI components to our logic in ◊code{ViewController.swift}. The values in this view are stored in the NSUserDefaults of the specific App Group. These values will then be used in the extension process.

