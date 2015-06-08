#lang pollen

◊headline{Step 1—Building Interface}

It’s a simple interface that we have an ◊code{UITextView} and ◊code{UIButton}.

For the navigation bar, we use the ◊code{UINavigationController} and set this view controller as its ◊code{rootViewController}


After this step, you should have the following ◊code{IBOutlet} created.


◊swift{
  @IBOutlet weak var mainTextView: UITextView!
  @IBOutlet weak var bottomMargin: NSLayoutConstraint!
  @IBOutlet weak var saveButton: UIButton!
}

◊code{bottomMargin} is the distance constraint of save button’s buttom to view controller’s bottom edge.