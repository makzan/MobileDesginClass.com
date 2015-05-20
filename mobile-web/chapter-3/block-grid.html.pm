#lang pollen

◊headline{Block grid}

Foundation provides ◊code{small-block-grid-N}, ◊code{medium-block-grid-N} and ◊code{large-block-grid-N}. It’s very convinent when we need to spread the content evenly inside a space.

◊html{
<ul class="small-block-grid-2 medium-block-grid-4">
  <li><img src="http://placehold.it/300x200" alt="placeholder" /></li>
  ...
  <li><img src="http://placehold.it/300x200" alt="placeholder" /></li>
</ul>
}

◊link["http://jsfiddle.net/makzan/z5u8kcud/"]{Open example in jsFiddle.}

◊(compare
  ◊figure["http://makzan.net/assets/mobile-web-design/block-grid-wide-9bedba3425b619a01749c4c2d8f87c90.png"]{Block grid displayed in wide screen.}
  ◊figure["http://makzan.net/assets/mobile-web-design/block-grid-small-e815b1ba2c994ccdf6d8b966edf5bada.png"]{Block grid displayed in small screen.}
)
