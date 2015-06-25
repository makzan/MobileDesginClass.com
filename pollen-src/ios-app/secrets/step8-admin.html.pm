#lang pollen

◊headline{Step 8—Admin}

The admin is a tab bar controller that contains 2 table view controllers: ◊em{NewSecretsViewController} and ◊em{ApprovedSecretsViewController}.

◊(steps
  ◊step{Create a new target and initialize the Parse library in the ◊em{AppDeletage} class.}
  ◊step{Make the application a tab bar controller. It contains 2 table view controllers, which are ◊em{NewSecretsViewController} and ◊em{ApprovedSecretsViewController}.}
  ◊step{Enable the Refresh Control in both table view controller.}
  ◊step{In the ◊code{viewDidLoad} function, we register the refresh control’s event.
    ◊swift{
      self.refreshControl?.addTarget(self, action: "refresh", forControlEvents: UIControlEvents.ValueChanged)
    }
  }
  ◊step{Then we implement the ◊em{refresh} function in the ◊em{NewSecretsViewController} class:
    ◊swift{
      func refresh() {
        Secrets.sharedSecrets.allNonApprovedSecrets { (entries) -> Void in
          self.entries = entries
          self.tableView.reloadData()
        }
      }
    }
  }
  ◊step{In the ◊em{ApprovedSecretsViewController} class, we implement the same refresh function. But we call the ◊code{allApprovedSecrets} function instead.}
  ◊step{For both view controllers, we implement the following table view data source functions:
    ◊swift{
      override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.entries.count
      }

      override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("cell")
        if cell==nil {
          cell = UITableViewCell(style: .Default, reuseIdentifier: "cell")
        }

        cell?.accessoryType = .None
        if entries[indexPath.row]["is_public"] as! Bool == true {
          cell?.accessoryType = .Checkmark
        }

        cell?.textLabel?.text = entries[indexPath.row]["content"]

        return cell!
      }
    }
  }
  ◊step{When any row is selected, we toggle the approval state. The ◊em{NewSecretsViewController} class calls the ◊code{approveSecret} function and the ◊em{ApprovedSecretsViewController} class calls the ◊code{unapproveSecret} function. The other part is the same.
    ◊swift{
      override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)

        Secrets.sharedSecrets.approveSecret(entries[indexPath.row])

        tableView.reloadData()
      }
    }
  }
  ◊step{In the ◊code{NewSecretsViewController} class, we allow deleting the table view cell by the following delegate function:
    ◊swift{
      override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
          Secrets.sharedSecrets.deleteSecret(entries[indexPath])

          let newEntries = NSMutableArray(array: entries)
          newEntries.removeObjectAtIndex(indexPath.row)
          entries = newEntries

          tableView.deleteRowsAtIndexPaths(indexPath, withRowAnimation: .Fade)
        }
      }
    }
  }
)