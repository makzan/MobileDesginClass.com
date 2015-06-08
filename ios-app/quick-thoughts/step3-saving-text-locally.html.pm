#lang pollen

◊headline{Step 3—Saving text locally}

We want to save the text locally before saving the text into other services. We monitor the content change of the text view and save the text locally.

◊(steps
  ◊step{Make sure we have set the delegate of the ◊code{UITextView} to the ◊code{ViewController}.
  }
  ◊step{Since we have set the delegate, we need to include the ◊code{UITextViewDelegate} in the class header line. The ◊code{ViewController} class declaration becomes the following:
    ◊swift{
      class ViewController: UIViewController, UITextViewDelegate {
    }
  }
  ◊step{At the beginning of the ◊code{ViewController.swift} file, we add the following constant.
    ◊swift{
      let SAVED_TEXT_KEY = "SAVED_TEXT_KEY"
    }
  }
  ◊step{Somewhere in the code, we addd the following block of logic:
    ◊swift{
      // MARK: - TextView Content

      func initTextViewContent() {
        self.mainTextView.text = ""

        // try to load from NSUserDefault.
        let userDefault = NSUserDefaults.standardUserDefaults()
        if (userDefault.objectForKey(SAVED_TEXT_KEY) != nil) {
            self.mainTextView.text = userDefault.stringForKey(SAVED_TEXT_KEY)
        }
      }

      func textViewDidChange(textView: UITextView) {
        // save to NSUserDefault until save.
        let userDefault = NSUserDefaults.standardUserDefaults()
        userDefault.setObject(textView.text, forKey: SAVED_TEXT_KEY)
      }
    }
  }
  ◊step{Then we update the ◊code{viewDidLoad} method to call the ◊code{initTextViewContent} function.}
    ◊swift{
      override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        initTextViewContent()

        registerKeyboardEvents()

        mainTextView.becomeFirstResponder()
      }
    }
  }
)


◊section{What just happened?}

We just stored our text locally and restore the text every time the app launches. At this moment, the app serves as a quick note taking utility that what you have written is always there for you to porcess.

◊section{Declaring Delegate in Class Header}

Back in the Objective-C time, compiler warns us when we miss any delegation declaration. We had to declare what delegate the class handles to get rid of the warning. In the swift compiler, the warning is gone. But I still keep this good habit. 2 reasons: 

1. I can easily ◊em{command+click} on the class header to view the list of delegate methodns that I can use.
2. If there is any required functions in the delegate, the complier throws errors and fail to build. This prevent run-time crash when the original logic call the required delegate functions and not found.

