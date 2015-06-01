#lang pollen

◊headline{Step 8—Creating today extension}

In this step, we create an extension for the app. We allow user to schedule a new timer via the today extension panel. We discuss how the extension app can share the same user defaults from the main app. We also go through how the extension invokes the main application.

◊(steps
  ◊step{Create a new target from the project.
    ◊figure["https://dl.dropboxusercontent.com/u/3079250/Public%20for%20MobileDesignClass/ios/Screen%20Shot%202015-05-28%20at%202.07.33%20PM.png"]{New target}
  }
  ◊step{Choose ◊em{Today Extension}.
    ◊figure["https://dl.dropboxusercontent.com/u/3079250/Public%20for%20MobileDesignClass/ios/Screen%20Shot%202015-05-28%20at%202.07.46%20PM.png"]{Today Extension}
    ◊figure["https://dl.dropboxusercontent.com/u/3079250/Public%20for%20MobileDesignClass/ios/Screen%20Shot%202015-05-28%20at%202.08.03%20PM.png"]{Give the extension a name}
  }
  ◊step{Then we design the interface for the Today extension. Make the interface like the following. The label is linked as ◊code{countDownLabel} IBOutlet. The buttons are linked as ◊code{add30s}, ◊code{minus30s} and ◊code{start} IBActions correspondingcally.

    ◊figure["https://dl.dropboxusercontent.com/u/3079250/Public%20for%20MobileDesignClass/ios/Screen%20Shot%202015-05-28%20at%202.45.01%20PM.png"]{Interface for today extension}
  }

  ◊step{There is a left margin on the view content in today extension by default. We can reset this margin by using the following delegate method:
    ◊swift{
      func widgetMarginInsetsForProposedMarginInsets(defaultMarginInsets: UIEdgeInsets) -> UIEdgeInsets {
        return UIEdgeInsetsZero
      }
    }
  }

  ◊step{

    ◊sidenote{
      ◊figure["https://dl.dropboxusercontent.com/u/3079250/Public%20for%20MobileDesignClass/ios/Screen%20Shot%202015-05-28%20at%202.28.28%20PM.png"]{Xcode is loading the developer profile through internet}
    }

    For both parent app and the today extension app, we need to add them into the same App Group. The App Group is actually configured on Apple’s developer center. So Xcode may ask for your developer profile when turing this setting on. Choose a unique app group ID and use it in both parent app and today extension target.

    ◊figure["https://dl.dropboxusercontent.com/u/3079250/Public%20for%20MobileDesignClass/ios/Screen%20Shot%202015-05-28%20at%202.29.28%20PM.png"]{Setting App Group}
  }

  ◊step{In the ◊code{MZTimer.swift} file, we change the user default to the following, which specify the app group that we configured.
    ◊swift{
      func sharedUserDefault() -> NSUserDefaults {
        return NSUserDefaults(suiteName: "group.net.makzan.KitchenTimer-Swift")!
      }
    }
  }

  ◊step{TodayViewController.swift:
    ◊swift{
      @IBOutlet weak var countDownLabel: UILabel!
    }
  }
  ◊step{Define an instant variable in the extension class.
    ◊swift{
      var seconds:NSTimeInterval = 0
    }
  }

  ◊step{The ◊code{add30s} and ◊code{minus30s} has the same logic as the main app.
    ◊swift{
      // MARK: - IBActions

      @IBAction func add30s(sender: AnyObject) {
        seconds += 30
      }
      @IBAction func minus30s(sender: AnyObject) {
        seconds = max(seconds-30, 0) // minus 30, minimun 0.
      }
    }
  }

  ◊step{The interface timer is same as the main app.
    ◊swift{
      // MARK: - Timer interface
      func startUITimer() {
        let timer = NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: "tick", userInfo: nil, repeats: true)
      }

      func tick() {
        // only tick the UI timer when the MZTimer is running for any local notification.
        if (!MZTimer.sharedTimer.isRunning()) {
          countDownLabel.text = (seconds as NSNumber).stringOfMinutesSeconds() as String
          return
        }

        let elapsedSeconds = MZTimer.sharedTimer.elapsedSeconds()
        let targetDuration = MZTimer.sharedTimer.targetDuration()
        let remainSeconds:NSNumber = targetDuration + elapsedSeconds // elapsedSeconds is always negative.

        countDownLabel.text = remainSeconds.stringOfMinutesSeconds() as String
      }
    }
  }

  ◊step{Next, we create a connection between the extension and the main application. We do that by using the application URL scheme. Configure the main app with the following URL type.

    ◊sidenote{Note: You may want to choose a different URL scheme because this scheme shares among all the iOS apps installed in the device.}

    ◊figure["https://dl.dropboxusercontent.com/u/3079250/Public%20for%20MobileDesignClass/ios/Screen%20Shot%202015-05-28%20at%202.16.08%20PM.png"]{Setting URL scheme in the main app}
  }

  ◊step{When user presses ◊em{start} button in the extension, it actually launches the parent app by calling URL. Extension cannot invoke NSLocalNotification directly.

    ◊swift{
      @IBAction func start(sender: AnyObject) {
        let urlString = NSString(format: "mz-kitchentimer://%.0f", seconds) as String
        let url = NSURL(string: urlString)
        extensionContext?.openURL(url!, completionHandler: nil)
      }
    }
  }

  ◊step{Let’s move to the main app’s ◊code{AppDelegate.swift} file. In the parent app, we handle the URL launching by using the ◊code{application:handleOpenURL:} method. Inside the method, we capture the URL, which is the ◊em{seconds} passes from the extension. Then we setup a new timer from the value.

    ◊swift{
      func application(application: UIApplication, handleOpenURL url: NSURL) -> Bool {
        if (url.host != nil) {
          let seconds = (url.host! as NSString).doubleValue
          MZMutableTimer.sharedMutableTimer.scheduleAlertForSeconds(seconds)
        }
        return true
      }
    }
  }
)