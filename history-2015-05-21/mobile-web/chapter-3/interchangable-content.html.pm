#lang pollen

◊headline{Interchangable content}

Responsive design comes with a downside: It wastes (mobile data) bandwidth if a lot of information is hidden in small screen. And it slows down the page loading.

◊sidenote{
  ◊figure["http://makzan.net/assets/mobile-web-design/interchangable-5d1c90ac6ff5e183f9e07a8e310c2b9d.png"]{Showing different image sources for different screen sizes.}
}

An optimal way to archive the same effect is by using interchange. We use javascript to load the image at the size that fits the reader's screen. Smaller image for small screen. Higher resolution image for larger screen. The readers only need to load what they are going to read. They should never load something that they don't see and use.

The reason we need to interchange content is because of the loading bandwidth. In the visibility section, we show and hide content based on the screen size. But the reader have to download all the content. Assuming the reader is reading on mobile but we load a large image for large screen reader. Then the mobile reader needs to download a high resolution image with the cecular data but never see this image.

◊markup{
<img data-interchange="[/path/to/default.jpg, (default)], [/path/to/bigger-image.jpg, (large)]">
<noscript><img src="/path/to/default.jpg"></noscript>
}

Demo:

◊iframe{http://jsfiddle.net/makzan/XFye6/embedded/result/}

Foundation website provides a detailed tutorial on using the interchangable content in different scenarios. Ensure to check it out.

◊section{Exercise}

◊link["http://jsfiddle.net/makzan/hLHBu/"]{Exercise: Try to define 2 sizes of image for the header.}



