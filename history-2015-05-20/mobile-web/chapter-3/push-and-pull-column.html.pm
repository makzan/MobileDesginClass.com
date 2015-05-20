#lang pollen

◊headline{Push and pull columns}

A special push and pull class allows us to change the order of the columns.

◊link["http://jsfiddle.net/makzan/7vgsnxo0/"]{Open example in jsFiddle.}

◊figure["http://makzan.net/assets/mobile-web-design/push-pull-sidebar-right-5953c64eacf0ffd9a4b251271251bf51.png"]{Our example starts in this layout.}

◊html{
<div class='row'>
  <div class='small-9 columns'>Content</div>
  <div class='small-3 columns'>Sidebar</div>
</div>
}

What if we want to put the sidebar on the left? Instead of moving the sidebar content in front of the main content, we change their ordering in CSS.

◊figure["http://makzan.net/assets/mobile-web-design/push-pull-sidebar-left-21b73bfabdae74ecce5fa80b8fadfc95.png"]{Sidebar on the left.}

◊html{
<div class='row'>
  <div class='small-9 small-push-3 columns'>Content</div>
  <div class='small-3 small-pull-9 columns'>Sidebar</div>
</div>
}

◊sidenote{
  ◊figure["http://makzan.net/assets/mobile-web-design/push-pull-9fd0ab8adef76abd004982bbea02846c.png"]{Pushing columns.}
}

HTML defines the order of the content. The order shows how important the content is. More important content are placed before other content.

When we float the columns from left to right. It follows the order of the column divs.

For instance, if we want to swap the side bar from right to left, we can either change the HTML or we can change the CSS class by using this foundation class. Both code result in the same output visually. So what is the difference?

The difference is that the foundation class solution doesn't change the order of the HTML element. We keep the same definition that content is more important than the side bar. But visually, we have our choice to define whether the side bar goes to the left or right side visually.