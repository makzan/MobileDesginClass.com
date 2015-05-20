#lang pollen

◊headline{Centered column}

We can center a column by using the ◊code{small-centered} class.

◊sidenote{
  ◊figure["http://makzan.net/assets/mobile-web-design/centered-column-1c670ec81b55a7103a053d4ae9d180e8.png"]{Demo of centered column.}
}

Here is a demo on centered column.

As same as the grid, there is ◊code{medium-centered} and ◊code{large-centered} class. We don’t need the medium and large because they will inherit the ◊code{small-centered} class if we hasn’t specify.

If we want to un-center a column in specific screen size, we can use the ◊code{medium-uncentered} and ◊code{large-uncentered}.

◊link["http://jsfiddle.net/makzan/5ww8u5c1/"]{Open example in jsFiddle.}

HTML

◊markup{
<div class='header-bg'>
  <div class='row'>
    <div class='small-6 small-centered columns'>Big Title Here</div>
  </div>
</div>
}

CSS

◊css{
.header-bg {
  background: url(http://placekitten.com/1000/500) center center;
  background-size: cover;
  background-attachment: fixed;
  padding: 3em;
}

.columns {
  background: rgba(255, 255, 255, .5);
  border: 1px solid blue;
  padding-top: 1em;
  padding-bottom: 1em;
  margin-bottom: 1em;
}
}
