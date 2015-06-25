#lang pollen

◊headline{Step 3—Initialize Parse}

◊(steps
  ◊step{In ◊code{AppDelegate.swift}, we initialize the Parse.}
  ◊step{We import the ◊code{Parse} and ◊code{Bolts} module.
    ◊swift{
      import Parse
      import Bolts
    }
  }
  ◊step{Inside the applicationDidLaunch function, we initial the Parse code.
    ◊swift{
      func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.


        // [Optional] Power your app with Local Datastore. For more info, go to
        // https://parse.com/docs/ios_guide#localdatastore/iOS
        Parse.enableLocalDatastore()

        // Initialize Parse.
        Parse.setApplicationId(<Your App ID>,
            clientKey: <Your Client Key>)

        // [Optional] Track statistics around application opens.
        PFAnalytics.trackAppOpenedWithLaunchOptions(launchOptions)

        Secrets.sharedSecrets.loadEntries()

        return true
      }
    }
  }
)