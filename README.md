# Artemis in Docker

# What?

Artemis doesn't have a dedicated server. This runs the Artemis program under wine.

# How

It uses xdotool to configure the server. Currently it only runs the Demo version 
of Artemis.

# Usage

````
make
````

# TODO

* Work in some way to do the Retail version of Artemis if provided.
* Handle environment vars or something to configure the server (difficulty, etc)
* More robust error handling?
* Speed improvements?
