#lang pollen

◊headline{Flex video}

Here is a demo showing the usage of ◊code{flex-video} class from Zurb Foundation. It keeps the proportion of the embed video player, resulting in a much better looking in various screen sizes.

An extra ◊code{widescreen} class would make the hight calculation uses the widescreen ratio.

◊markup{
<div class='row'>
  <div class='small-9 columns'>
    <div class="flex-video widescreen">
      <iframe src="//www.youtube.com/embed/KBA4IzyEUDU?rel=0" frameborder="0" allowfullscreen></iframe>
    </div>
  </div>
  <div class='small-3 columns'>Sidebar</div>
</div>
}

◊link["http://jsfiddle.net/makzan/58tL5bfy/"]{Open example in jsFiddle.}

◊figure["http://makzan.net/assets/mobile-web-design/flex-video-2470f3849d82d0b6a5860c5d86d8e156.png"]{Flexible video.}

