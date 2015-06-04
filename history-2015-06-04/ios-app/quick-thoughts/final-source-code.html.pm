#lang pollen

◊headline{Final source code of the project}

You may ◊link["https://dl.dropboxusercontent.com/u/3079250/Public%20for%20MobileDesignClass/ios/QuickThoughts.zip"]{download the final source code}. And here is the full ◊code{ViewController.swift} file:

◊swift{
  //
  //  ViewController.swift
  //  QuickThoughts
  //
  //  Created by Seng Hin Mak on 3/6/15.
  //  Copyright (c) 2015 Makzan. All rights reserved.
  //

  import UIKit

  let SAVED_TEXT_KEY="SAVED_TEXT_KEY"

  class ViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var mainTextView: UITextView!
    @IBOutlet weak var bottomMargin: NSLayoutConstraint!
    @IBOutlet weak var saveButton: UIButton!

    override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view, typically from a nib.

      initTextViewContent()

      registerKeyboardEvents()

      mainTextView.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
    }

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

    // MARK: - UI Actions

    @IBAction func saveThought(sender: AnyObject) {
      let activityViewController = UIActivityViewController(activityItems: [mainTextView.text], applicationActivities: nil)

      // for email sharing
      activityViewController.setValue("Quick Thoughts", forKey: "Subject")

      // for iPad
      activityViewController.popoverPresentationController?.sourceView = self.saveButton;

      activityViewController.completionWithItemsHandler = { activity, success, items, error in

        // content did shared
        if (success) {
          self.mainTextView.text = ""

          self.mainTextView.becomeFirstResponder()

          // clear saved content also
          let userDefault = NSUserDefaults.standardUserDefaults()
          userDefault.removeObjectForKey(SAVED_TEXT_KEY)
        }
      }

      let parentVC = UIApplication.sharedApplication().keyWindow?.rootViewController
      parentVC?.presentViewController(activityViewController, animated: true, completion: nil)
    }



    // MARK: - Keyboard events

    func registerKeyboardEvents() {
      NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardShows:", name: UIKeyboardWillShowNotification, object: nil)
      NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardHides:", name: UIKeyboardWillHideNotification, object: nil)
    }

    func keyboardShows(notification:NSNotification) {
      let keyboardRect = notification.userInfo![UIKeyboardFrameEndUserInfoKey]?.CGRectValue()

      NSLog("%@", NSStringFromCGSize(keyboardRect!.size))

      self.bottomMargin.constant = keyboardRect!.size.height
      self.view.layoutIfNeeded()
    }

    func keyboardHides(notification:NSNotification) {
      self.bottomMargin.constant = 0
      self.view.layoutIfNeeded()
    }
  }
}