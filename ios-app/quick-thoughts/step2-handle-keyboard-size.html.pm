#lang pollen

◊headline{Handling keyboard size changes}

We assumed you’re using Autolayout and you have created a constraint named ◊code{bottomMargin} which is distance between bottom of save button and bottom of the view controller.

◊(steps
  ◊step{In the ◊code{ViewController.swift} file, add the following code:
    ◊swift{
      // MARK: - Keyboard events

      func registerKeyboardEvents() {

        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardShows:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardHides:", name: UIKeyboardWillHideNotification, object: nil)
      }

      func keyboardShows(notification:NSNotification) {
        let keyboardRect = notification.userInfo![UIKeyboardFrameEndUserInfoKey]?.CGRectValue()

        self.bottomMargin.constant = keyboardRect!.size.height
        self.view.layoutIfNeeded()
      }

      func keyboardHides(notification:NSNotification) {
        self.bottomMargin.constant = 0
        self.view.layoutIfNeeded()
      }
    }
  }
  ◊step{Then we call the keyboard events in the ◊code{viewDidLoad} function. We also focus on the text view by default, which shows the keyboard right after the app launches.
    ◊swift{
      override func viewDidLoad() {
        super.viewDidLoad()
        registerKeyboardEvents()
        mainTextView.becomeFirstResponder()
      }
    }
  }
)

◊section{What just happened?}

We listened to the keyborad’s frame changes and change our layout according to the keyboard’s state.

The keyboard is controlled by the operating system. We can only detect it’s state changes by using the ◊code{NSNotification}. The system fires a ◊code{UIKeyboardWillShowNotification} when the keyboard shows, or changes frame. The system fires a ◊code{UIKeyboardWillHideNotification} when the keyboard hides.

◊sidenote{UIKeyboardWillShowNotification event also fires when the keyboard changes it’s frame, e.g. toggling ◊em{Predictive} suggestions.}


In the fired notification, we can get the frame before and after the change by using the ◊code{UIKeyboardFrameBeginUserInfoKey} and ◊code{UIKeyboardFrameEndUserInfoKey}. It’s ◊code{CGRect} wrapped inside ◊code{NSValue} in order to be put inside ◊code{Dictionary}.

At last, we called the ◊code{view.layoutIfNeeded()} to tell the view to update the layout immediately.