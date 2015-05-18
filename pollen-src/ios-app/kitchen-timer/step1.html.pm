#lang pollen

◊headline{Step 1}

In this step, we create the basic user interface.

◊steps{
  ◊step{Download the images from the ◊link["https://dl.dropboxusercontent.com/u/3079250/Public%20for%20MobileDesignClass/ios/Interfaces%20for%20Kitchen%20Timer.zip"]{this link}.
  }
  ◊step{Crate new XCode project, with ◊em{swift} and ◊em{universal} option}

  ◊step{
    ◊sidenote{
      ◊figure["https://dl.dropboxusercontent.com/u/3079250/Public%20for%20MobileDesignClass/ios/Screen%20Shot%202015-05-17%20at%209.10.50%20PM.png"]{Main.storyboard}
    }

    Setup the interface like the following.
  }

  ◊step{Create outlet.

    ◊swift{
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    }
  }
  ◊step{Define 2 functions that controls the interface visibility.

    ◊swift{
    // MARK - UI Visibility

    func showRunningUI() {
        stopButton.hidden = false
        startButton.hidden = true
    }

    func showPrepareUI() {
        stopButton.hidden = true
        startButton.hidden = false
    }
    }
  }

  ◊step{Then we define the following button handler.

    ◊swift{
    @IBAction func startTimer(sender: AnyObject) {
        showRunningUI()
    }

    @IBAction func cancelTimer(sender: AnyObject) {
        showPrepareUI()
    }
    }
  }
  ◊step{At last, we setup the interface at the viewDidLoad
    ◊swift{
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        showPrepareUI()
    }
    }
  }
}