#lang pollen

◊headline{Step 6—View Controller}

◊(steps
  ◊step{When the view loads:
    ◊swift{
      override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let urlString = "https://secrets-cm478-demo.parseapp.com/show-secret.html"
        webview.loadRequest(NSURLRequest(URL: NSURL(string: urlString)!))
      }
    }
  }
  ◊step{We define a function that call the JavaScript in the web view to display the content from Xcode runtime.
    ◊swift{
      func showSceretInWebView(content:String) {
        let js = NSString(format: "setContent('%@');", content) as String
        webview.stringByEvaluatingJavaScriptFromString(js)
      }
    }
  }
  ◊step{When the web view first loaded, we initial the secrets content with the default one.
    ◊swift{
      func webViewDidFinishLoad(webView: UIWebView) {
        let content = Secrets.sharedSecrets.defaultSecretContent()
        showSceretInWebView(content)
      }
    }
  }
  ◊step{We also need another function to show the next secret.
    ◊swift{
      func showNextSecret() {
        let content = Secrets.sharedSecrets.nextSecretContent()
        showSceretInWebView(content)
      }
    }
  }
  ◊step{For each request from the web view, we check if it’s a normal web page loading or it’s the next button
    ◊swift{
      func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        if (request.URL?.absoluteString.rangeOfString("#next") != nil) {
          showNextSecret()
          return false
        }
        return true
      }
    }
  }
)