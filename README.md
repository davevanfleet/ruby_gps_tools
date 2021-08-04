# GPS Tools

This project is a library of functions that can be used for simple calculations related to GPS coordinates and maps.  It was primarily created as a means of moving intensive calculations and functions away from client side (where something like Google Maps JS library would likely be used) to server side.  This also allows for reducing strain on backend systems for projects that involve location-based contact management, since those contacts can be more easily filtered, thus reducing strain from excessive read requests for a given geograhic location.

## Installation and Usage

Install this gem with:  

```
gem install gps_tools
```

To use the gem in your Ruby project:  

```
require 'gps_tools'
...

distance = GPSTools.distance([0, 0], [0, 0], "miles")
in_polygon = GPSTools.in_polygon?(polygon, [40, 40])

```

## Licence

This project is open source, licenced under the MIT license.  See `LICENSE` for more information.
