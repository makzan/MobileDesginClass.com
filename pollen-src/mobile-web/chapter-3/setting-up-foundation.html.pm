#lang pollen

◊headline{Setting up Foundation}

Setting up Foundation
Foundation is a library with both css and javascript code.

If we don’t use any components that required javascript, we can omit the javascript part and just include the css.


◊sidenote{
  ◊figure["http://makzan.net/assets/mobile-web-design/download-foundation-44ce6a431672bababc2fc18d69348c9b.png"]{Downloading foundation.}
}

In this chapter, we will use the full library.

1. Go to the Foundation website.
2. Choose “Download Foundation”
3. Then choose “Download Everything”


◊sidenote{
  ◊figure["http://makzan.net/assets/mobile-web-design/foundation-customize-5472ab7c7cb09d544c21b34b5375061d.png"]{Customizing foundation components.}
}

If you need to customise the layout or the framework variable, you can customise the variables in their download page before downloading. The website will compile the custom build for us.

Later in the preprocessing chapter, we will learn the option to customise the framework locally in the development machine.

Here you can find the list of the files we get and their purposes from Foundation package.

This is the suggested HTML setup by Zurb.

◊markup{
<!DOCTYPE html>
<!--[if IE 9]><html class="lt-ie10" lang="en" > <![endif]-->
<html class="no-js" lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Foundation 5</title>

  <!-- You may add app.css to use for your overrides if you like -->
  <link rel="stylesheet" href="css/normalize.css">
  <link rel="stylesheet" href="css/foundation.css">

  <script src="js/vendor/modernizr.js"></script>

</head>
<body>

  <!-- body content here -->

  <script src="js/vendor/jquery.js"></script>
  <script src="js/foundation.min.js"></script>
  <script>
    $(document).foundation();
  </script>
</body>
</html>
}

If we don’t need the modernizr, we can use the following:

◊markup{
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Foundation 5</title>

  <!-- You may add app.css to use for your overrides if you like -->
  <link rel="stylesheet" href="css/normalize.css">
  <link rel="stylesheet" href="css/foundation.css">

</head>
<body>

  <!-- body content here -->

  <script src="js/vendor/jquery.js"></script>
  <script src="js/foundation.min.js"></script>
  <script>
    $(document).foundation();
  </script>
</body>
</html>
}

If we just need the CSS part and not using any of the JavaScript depended component, we can further trim the code into the following:

◊markup{
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Foundation 5</title>

  <!-- You may add app.css to use for your overrides if you like -->
  <link rel="stylesheet" href="css/normalize.css">
  <link rel="stylesheet" href="css/foundation.css">

</head>
<body>

  <!-- body content here -->

</body>
</html>
}