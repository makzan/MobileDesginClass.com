#lang pollen

◊headline{Foundation grid}

Foundation uses row and columns approach for the layout.

◊sidenote{
  ◊figure["http://makzan.net/assets/mobile-web-design/row-column-grid-6113c4d65e2f9513a6603b7999c5adb4.png"]{row-column-based layout.}
}

◊strong{Rows} are the space lay out from top to bottom.

◊strong{Columns} are the space inside each row, lay out fro left to right.

If the content are meant to be inside the grid system, make sure we put the content inside column and columns inside row.


The columns order from left to right following the order of the divs by default. we may change the order by using push and pull classes where we will discuss very soon.

Here is a demo for the basic grid.

◊html{
<div class='row'>
  <div class='small-3 columns'>Left Nav Bar</div>
  <div class='small-9 columns'>Content</div>
</div>
}

◊figure["http://makzan.net/assets/mobile-web-design/grid-basic-wide-ea67aeb5f8c9a58dcde55d9189fd88dd.png"]{Small grid expands to wide screen.}

◊figure["http://makzan.net/assets/mobile-web-design/grid-basic-narrow-763e82ec1a73b0553c8c78f774d95c79.png"]{Small grid for small screen.}

After we add the medium columns setting, the propotional varies between small and medium screen.

◊html{
<div class='row'>
  <div class='small-6 medium-3 columns'>Left Nav Bar</div>
  <div class='small-6 medium-9 columns'>Content</div>
</div>
}

◊figure["http://makzan.net/assets/mobile-web-design/medium-grid-wide-1e064346710175bcfd2edd49a39d8c38.png"]{Small grid expands to wide screen.}

◊figure["http://makzan.net/assets/mobile-web-design/medium-grid-small-12bb8ad1a861a74d8b421582c141766e.png"]{Small grid for small screen.}

◊link["http://jsfiddle.net/makzan/1ncwbwoa/"]{Open example in jsfiddle.}

◊sidenote{
  ◊figure["http://makzan.net/assets/mobile-web-design/small-n-3a089deccd0465967a4b9c9a779d6d88.png"]{Small, medium, large.}
}

Foundation is mobile first. Zurb Foundation uses ◊code{small-N}, ◊code{medium-N} and ◊code{large-N} to define how many columns span for ◊em{small}, ◊em{medium} and ◊em{large} screen. But only the small one is required, medium and large one is optional.

When designing the grid in Zurb Foundation, we craft the grid for small screen first.

If the grid for small screen work in larger size (medium and large), we don’t need to do anything and it will expand to the larger width until reaching the max width.

If we think we should devide the row into different columns when the screen is at medium or large size, we can further use the ◊code{medium-N} and ◊code{large-N} column class to define them.

We can even provide different proportion for the various screen sizes.