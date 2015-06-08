#lang pollen

◊headline{Minimal mobile friendly website}

The following code example shows how we can create a minimal website style that fits in small screen reading.

The HTML:

◊markup{
<header>
  <div class="row">
    Website Title here
  </div>
</header>

<nav>
  <div class="row">
    <ul>
      <li>Link 1</li>
      <li>Link 2</li>
      <li>Link 3</li>
    </ul>
  </div>
</nav>

<div class="row">
  <article>
    <header>
      <h1>Heading of the content</h1>
    </header>

    <p>Content paragraphs go here.</p>

    <footer>
      Author: Makzan
    </footer>

  </article>
</div>

<footer>
  <div class="row">
    Copyright goes here.
  </div>
</footer>
}

The CSS:

◊sidenote{
  Note: We used box-sizing in our CSS. You may reference to the ◊link["https://developer.mozilla.org/en-US/docs/Web/CSS/box-sizing"]{Mozilla documentation}.
}

◊css{
/* normalize */
body, nav, ul, li, p, h1, h2, h3 {
    padding: 0;
    margin: 0;
}

/* core styles */
* {
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
}

body > header,
body > footer {
    background: #ffce25;
}

.row {
    width: 100%;
    max-width: 600px;
    margin: 0 auto;
    padding: 10px;
}

/* addition styles */
ul {
    list-style: none;
}

h1, p {
    margin-bottom: .5em;
}
}

Please find the following screenshot showing the minimal web site display in both normal view and article view in mobile Safari.

◊(compare
  ◊figure["http://makzan.net/assets/mobile-web-design/sample-article-normal-6ffea1d2724da3e76cd697f46f19ee9a.png"]{Website showing in iPhone screen.}
  ◊figure["http://makzan.net/assets/mobile-web-design/sample-article-article-view-bd5614c63bfafc057d27703bf252243d.png"]{Website showing in iPhone article view.}
)