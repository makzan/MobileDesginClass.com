#lang pollen

◊headline{Pull to refresh with UIRefreshControl}

Step 1: Enable the ◊em{Refreshing} option in any ◊code{UIScrollView} in Storyboard.

◊figure["http://makzan.net/assets/ios-dev-scrapbook/table-view-refreshing-enabled-8c1dbb2ed1734edcd6a38345409a997e.png"]{Table view refreshing enabled in Storyboard.}

Step 2: Setup the refresh logic that tracks the ◊code{UIControlEventValueChanged} event:

◊objc{
[self.refreshControl addTarget:self
                        action:@selector(refreshNews:)
              forControlEvents:UIControlEventValueChanged];
}

Step 3: Implement the selector with logic that’s executed when user pulls and refreshes the view.

◊objc{
- (void) refreshNews: (id)selector {
  // logic here to refresh the table view.
}
}
