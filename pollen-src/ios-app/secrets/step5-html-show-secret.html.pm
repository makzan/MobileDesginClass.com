#lang pollen

◊headline{Step 5—HTML showing secrets}

◊(steps
  ◊step{Implement the following HTML and host it somewhere on the web.
    ◊markup{
      <!DOCTYPE html>
      <html lang='en'>
        <head>
          <title>Show a secret | Secrets App</title>
          <style>
            * {box-sizing: border-box;}
            html {margin: 0; padding: 0;}
            body {
              margin: 0;
              padding: 3em;
              font-size: 16px;
              font-family: Verdana, Helvetica, Arial, sans-serif;
            }
            #content {
              padding: 3em;
              background: LIGHTGREY;
            }
            a {
              display: block;
              background: GOLD;
              color: WHITE;
              box-shadow: 0 3px 0 YELLOW;
              text-align: center;
              padding: 2em;
              line-height: 50px;
              width: 100%;
            }
          </style>
        </head>
        <body>
          <div id='content'>Placeholder text for a secret.</div>
          <a href='#next'>Next Secret</a>
          <script>
            var contentDiv = document.getElementById('content');
            function setContent(content) {
              contentDiv.textContent = content;
              return true;
            }
          </script>
        </body>
      </html>
    }
  }
)