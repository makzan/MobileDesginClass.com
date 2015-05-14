#lang pollen

◊headline{Document title}

First thing is the title of the document. Title of the document is used in the following places:

◊list{
  ◊item{Home screen}
  ◊item{Bookmark}
  ◊item{History log}
  ◊item{Tab}
  ◊item{Back button in browser}
  ◊item{Social network}
}

◊(sidenote
◊figure["http://makzan.net/assets/mobile-web-design/fb-sharing-6d9154db003a1668e3130cb407dd988d.png"]{Document title appears in the facebook sharing box.}
)

This screen shot of sharing a webpage on Facebook. Facebook fetches the document title when it is shared.

Actually Facebook searches for the ◊code{og} meta tag to restrieve the HTML document’s title and other information. If the ◊code{og} meta is missing, Facebook searches for the document title and heanding.


◊(sidenote
◊figure["http://makzan.net/assets/mobile-web-design/macao-gov-history-dca0a7b80f9f6bd8b0edfadfa7c3c49c.png"]{Same document title on every page}
)

This screenshot shows how confuse it is when every page shares the same document title.

Imagine now your reader would like to go back several pages in the history. For sure the reader will fails to identify which history item is the page that he is finding, because every page has the same title.

◊(sidenote
◊figure["http://makzan.net/assets/mobile-web-design/makzan-net-history-e95b6f2bf8146faa685b4230819b5eb2.png"]{Different document title for each page}
)

In this screenshot, on the other hand, shows the website with corresponding title set for each page. Every page has set a title that describes what the page is about. It also contains the site name so reader can easily identify these pages are from the same website when viewing them in the history log.


[We need another paragraph here to explain and conclude this topic, We need another paragraph here to explain and conclude this topic. We need another paragraph here to explain and conclude this topic, We need another paragraph here to explain and conclude this topic. We need another paragraph here to explain and conclude this topic, We need another paragraph here to explain and conclude this topic. ]

