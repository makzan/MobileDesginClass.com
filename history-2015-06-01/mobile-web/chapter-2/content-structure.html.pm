#lang pollen

◊headline{Content Structure}

The first step is not make your website fit in mobile. The first thing you should do is make your content fits in the mobile device.

Remember, people don’t consume website. They consume content.

◊figure["http://makzan.net/assets/mobile-web-design/article-extraction-e53fe89a49c9af7ab3f3ff1edbf4db76.png"]{Main content is marked as green color.}

◊section{Article view—Broken one}

There is an article view in mobile Safari. The iOS parsed the web page and try to extract the content for a better reading experience.

◊(compare
  ◊figure["http://makzan.net/assets/mobile-web-design/macao-portal-normal-ce63f22e8d690e098f9515c43e13cefc.png"]{The article displayed in it’s original website.}
  ◊figure["http://makzan.net/assets/mobile-web-design/macao-portal-article-6966ecea6f9fdf174a5e192ed68d45c6.png"]{The same article displayed by the browser’s article-only view.}
)


Notice that the important headline in the article is missing in the article view.

◊sidenote{
  ◊figure["http://makzan.net/assets/mobile-web-design/macao-portal-pocket-af2d1f13e31acf3ae9e479a4772c2eea.png"]{The same article being displayed in a read-later service.}
}

Moreover, most read-later service also supports content extraction. For example, the following screenshot shows how Pocket displays the content in its mobile app, with a good reading experience.

◊section{Article view—Woking one}

Here is another example:

◊(compare
  ◊figure["http://makzan.net/assets/mobile-web-design/hk-news-normal-84a6d19be802b50030461757defb91db.png"]{The article displayed in it’s original website.}
  ◊figure["http://makzan.net/assets/mobile-web-design/hk-news-article-38bb650278711696552af9a73783ed15.png"]{The same article displayed by the browser’s article-only view.}
)

◊section{Article in Evernote}

Similar article view is not only use in mobile but also desktop service, such as Evernote.


◊figure["http://makzan.net/assets/mobile-web-design/evernote-bb008aed895536b3ff62ac4a085df31d.png"]{Article being extracted by Evernote.}

So how we could make the system or service extract the content correctly?

When we plan our HTML structure, we can make use of the <article> tag. Here is the explanation from Mozilla.

◊blockquote{The HTML <article> Element represents a self-contained composition in a document, page, application, or site, which is intended to be independently distributable or reusable, e.g., in syndication.}

It’s often confusing when deciding when to use the section tag and when to use the article tag.

Good structure helps web service analysis your content.

Two quotes from the w3 spec helping us to choose between section and article.

◊blockquote{Authors are encouraged to use the article element instead of the section element when it would make sense to syndicate the contents of the element.}

◊blockquote{When an element is needed for styling purposes or as a convenience for scripting, authors are encouraged to use the div element instead. A general rule is that the section element is appropriate only if the element's contents would be listed explicitly in the document's outline.}



