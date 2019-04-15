<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
  <title>GameSource</title>
</head>


<body onload="myFunction()">
  <script>
    function myFunction() {
      var requestURL = "Games.json";
      var request = new XMLHttpRequest();
      try {
        // Opera 8.0+, Firefox, Chrome, Safari
        request = new XMLHttpRequest();
      } catch (e) {
        // Internet Explorer Browsers
        try {
          request = new ActiveXObject("Msxml2.XMLHTTP");

        } catch (e) {

          try {
            request = new ActiveXObject("Microsoft.XMLHTTP");
          } catch (e) {
            // Something went wrong
            alert("Your browser broke!");
            return false;
          }

        }
      }

      if (request.readyState == 4) {
        // Javascript function JSON.parse to parse JSON data
        var jsonObj = JSON.parse(request.responseText);

        // jsonObj variable now contains the data structure and can
        // be accessed as jsonObj.name and jsonObj.country.
        document.getElementById("first").innerHTML = jsonObj.description;
      }


      request.open('GET', requestURL, true);
      request.send();
    }
  </script>

  <div class="container">
    <h1>GameSource <small>by Oakmont Industries</small></h1>
    <h3>Search</h3>
    <form id="gameSearch">
      <div class="form-group">
        <label for="gameSearch">Name</label>
        <input type="text" class="form-control" id="gameSearch" placeholder="Search for a game ...">
      </div>
      <button type="search" class="btn btn-primary">Search</button>
    </form>
  </div>

  <div class="container">
    <h1>Games</h1>
    <a href="#" class="list-group-item">
      <img src="GTAV.jpg" class="img-thumbnail" alt="GTAV" style="width:6%" style="height:6%">
      <h4 class="list-group-item-heading">GTA V</h4>
      <p class="list-group-item-text"><b>
          Description:
        </b><br />
        When a young street hustler, a
        retired bank robber and a terrifying psychopath find themselves entangled with
        some of the most frightening and deranged elements of the criminal underworld,
        the U.S. government and the entertainment industry, they must pull off a series
        of dangerous heists to survive in a ruthless city in which they can trust nobody,
        least of all each other.<br />&copy Rockstar North 2013
      </p>
    </a>

    <a href="SuperMarioBros.html" class="list-group-item">
      <img src="SMB.jpg" class="img-thumbnail" alt="Super Mario Bros." style="width:6%" style="height:6%">
      <h4 class="list-group-item-heading">Super Mario Bros.</h4>
      <p class="list-group-item-text"><b>Description:</b><br />
        <div id="first">The game is based on a series of side-scrolling
          levels, each filled with enemies ranging from mushroomlike Goombas to evil turtles known as Koopa
          Troopas. The levelstake place in different settings, some in dungeons and some above ground, with
          fights against Bowser impersonators at the end of castle levels.<br />&copy Nintendo 1983 </div>
      </p>
    </a>
    <a href="#" class="list-group-item">
      <img src="STHH.png" class="img-thumbnail" alt="Sonic the Hedgehog" style="width:6%" style="height:6%">
      <h4 class="list-group-item-heading">Sonic the Hedgehog</h4>
      <p class="list-group-item-text"><b>Description:</b><br />Sonic the Hedgehog is a video game franchise produced by
        Sega centering on a series of high-speed platform games. Sonic, the protagonist, is an anthropomorphic
        blue hedgehog with supersonic speed.<br \>&copy Sega 1991</p>
    </a>
    <a href="#" class="list-group-item">
      <img src="Minecraft.jpg" class="img-thumbnail" alt="Minecraft" style="width:6%" style="height:6%">
      <h4 class="list-group-item-heading">Minecraft</h4>
      <p class="list-group-item-text"><b>Description:</b><br /> Minecraft is a sandbox video game created
        by Swedish game developer Markus Persson and released by Mojang in 2011. The game allows
        players to build with a variety of different blocks in a 3D procedurally generated world,
        requiring creativity from players.<br />&copy Mojang 2009</p>
    </a>
  </div>

  <div class="footer">
    <p>&copy2019 Oakmont Industries</p>
  </div>
  </div>


  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://chancejs.com/chance.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</body>

</html>
